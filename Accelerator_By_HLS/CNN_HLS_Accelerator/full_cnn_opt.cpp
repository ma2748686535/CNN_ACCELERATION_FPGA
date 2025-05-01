#include "full_cnn_opt.h"
#include <hls_stream.h>
#include <hls_math.h>


#define IMG_H   32
#define IMG_W   32
#define IMG_C   3

#define K1      3
#define CO1     32
#define OH1     (IMG_H - (K1-1))
#define OW1     (IMG_W - (K1-1))

#define K2      3
#define CI2     CO1
#define CO2     64
#define OH2     (OH1 - (K2-1))
#define OW2     (OW1 - (K2-1))

#define CLS     10


static inline float relu(float x) { 
    #pragma HLS INLINE
    return (x > 0) ? x : 0.0f; 
}


static void load_input(const float *in, hls::stream<float> &pix) {
    #pragma HLS INLINE off
    
    for (int i = 0; i < IMG_H; i++) {
        for (int j = 0; j < IMG_W; j++) {
            for (int ch = 0; ch < IMG_C; ch++) {
                #pragma HLS PIPELINE II=1
                pix.write(in[(i*IMG_W + j)*IMG_C + ch]);
            }
        }
    }
}


static void conv1_stage(
    hls::stream<float> &pix,
    const float        *w,
    const float        *b,
    hls::stream<float> &out
) {
    #pragma HLS INLINE off
    

    float W1[CO1][K1][K1][IMG_C];
    #pragma HLS ARRAY_PARTITION variable=W1 cyclic factor=4 dim=1
    
    float B1[CO1];
    #pragma HLS ARRAY_PARTITION variable=B1 complete dim=1
    

    for (int co = 0; co < CO1; co++) {
        #pragma HLS PIPELINE II=1
        B1[co] = b[co];
    }
    

    for (int co = 0; co < CO1; co++) {
        for (int kh = 0; kh < K1; kh++) {
            for (int kw = 0; kw < K1; kw++) {
                for (int ch = 0; ch < IMG_C; ch++) {
                    #pragma HLS PIPELINE II=1
                    W1[co][kh][kw][ch] = w[((co*K1 + kh)*K1 + kw)*IMG_C + ch];
                }
            }
        }
    }
    

    float line_buffer[K1][IMG_W][IMG_C];
    #pragma HLS ARRAY_PARTITION variable=line_buffer complete dim=1
    #pragma HLS ARRAY_PARTITION variable=line_buffer complete dim=3
    

    for (int r = 0; r < K1-1; r++) {
        for (int c = 0; c < IMG_W; c++) {
            for (int ch = 0; ch < IMG_C; ch++) {
                #pragma HLS PIPELINE II=1
                line_buffer[r][c][ch] = pix.read();
            }
        }
    }
    

    for (int h = 0; h < OH1; h++) {

        for (int c = 0; c < IMG_W; c++) {
            for (int ch = 0; ch < IMG_C; ch++) {
                #pragma HLS PIPELINE II=1

                for (int r = 0; r < K1-1; r++) {
                    line_buffer[r][c][ch] = line_buffer[r+1][c][ch];
                }

                line_buffer[K1-1][c][ch] = pix.read();
            }
        }
        

        for (int w = 0; w < OW1; w++) {

            for (int co = 0; co < CO1; co++) {
                #pragma HLS PIPELINE II=2
                float sum = B1[co];
                

                for (int kh = 0; kh < K1; kh++) {
                    for (int kw = 0; kw < K1; kw++) {
                        for (int ch = 0; ch < IMG_C; ch++) {
                            sum += line_buffer[kh][w+kw][ch] * W1[co][kh][kw][ch];
                        }
                    }
                }
                

                out.write(relu(sum));
            }
        }
    }
}


static void conv2_stage(
    hls::stream<float> &in,
    const float        *w,
    const float        *b,
    hls::stream<float> &out
) {
    #pragma HLS INLINE off
    

    float B2[CO2];
    #pragma HLS ARRAY_PARTITION variable=B2 complete dim=1
    

    for (int co = 0; co < CO2; co++) {
        #pragma HLS PIPELINE II=1
        B2[co] = b[co];
    }
    

    float W2_flat[CO2*K2*K2*CI2];
    #pragma HLS ARRAY_PARTITION variable=W2_flat cyclic factor=16 dim=1
    

    for (int i = 0; i < CO2*K2*K2*CI2; i++) {
        #pragma HLS PIPELINE II=1
        W2_flat[i] = w[i];
    }
    
 
    float feature_buf[OH1*OW1*CI2];
    #pragma HLS ARRAY_PARTITION variable=feature_buf cyclic factor=8 dim=1
    
 
    for (int i = 0; i < OH1*OW1*CI2; i++) {
        #pragma HLS PIPELINE II=1
        feature_buf[i] = in.read();
    }
    

    for (int h = 0; h < OH2; h++) {
        for (int w = 0; w < OW2; w++) {
            for (int co = 0; co < CO2; co++) {
                #pragma HLS PIPELINE II=2
                float sum = B2[co];
                
                
                for (int kh = 0; kh < K2; kh++) {
                    for (int kw = 0; kw < K2; kw++) {
                        for (int ch = 0; ch < CI2; ch++) {
                        
                            int feat_idx = ((h+kh)*OW1 + (w+kw))*CI2 + ch;
                            int weight_idx = ((co*K2 + kh)*K2 + kw)*CI2 + ch;
                            
                    
                            sum += feature_buf[feat_idx] * W2_flat[weight_idx];
                        }
                    }
                }
                
                
                out.write(relu(sum));
            }
        }
    }
}


static void gap_stage(
    hls::stream<float> &in,
    hls::stream<float> &out
) {
    #pragma HLS INLINE off
    
    const int SP = OH2 * OW2;  
    
    
    float accum[CO2] = {0};
    #pragma HLS ARRAY_PARTITION variable=accum cyclic factor=8 dim=1
    
    
    for (int h = 0; h < OH2; h++) {
        for (int w = 0; w < OW2; w++) {
            for (int co = 0; co < CO2; co++) {
                #pragma HLS PIPELINE II=1
                accum[co] += in.read();
            }
        }
    }
    
    
    for (int co = 0; co < CO2; co++) {
        #pragma HLS PIPELINE II=1
        out.write(accum[co] / SP);
    }
}


static void fc_stage(
    hls::stream<float> &in,
    const float        *w,
    const float        *b,
    float              *out
) {
    #pragma HLS INLINE off
    
    
    float features[CO2];
    #pragma HLS ARRAY_PARTITION variable=features cyclic factor=8 dim=1
    
    
    float biases[CLS];
    #pragma HLS ARRAY_PARTITION variable=biases complete dim=1
    
    
    for (int i = 0; i < CO2; i++) {
        #pragma HLS PIPELINE II=1
        features[i] = in.read();
    }
    
    
    for (int cls = 0; cls < CLS; cls++) {
        #pragma HLS PIPELINE II=1
        biases[cls] = b[cls];
    }
    
    
    for (int cls = 0; cls < CLS; cls++) {
        #pragma HLS PIPELINE II=2
        float sum = biases[cls];
        
        for (int i = 0; i < CO2; i++) {
            sum += features[i] * w[i*CLS + cls];
        }
        
        out[cls] = sum;
    }
}


extern "C" void full_cnn_opt(
    const float *input,
    float       *output,
    const float *conv1_w,
    const float *conv1_b,
    const float *conv2_w,
    const float *conv2_b,
    const float *fc_w,
    const float *fc_b
) {
    
    #pragma HLS INTERFACE m_axi port=input    bundle=IMG_IN   depth=3072 offset=slave
    #pragma HLS INTERFACE m_axi port=conv1_w  bundle=WEI1     depth=864  offset=slave
    #pragma HLS INTERFACE m_axi port=conv1_b  bundle=WEI1     depth=32   offset=slave
    #pragma HLS INTERFACE m_axi port=conv2_w  bundle=WEI2     depth=18432 offset=slave
    #pragma HLS INTERFACE m_axi port=conv2_b  bundle=WEI2     depth=64   offset=slave
    #pragma HLS INTERFACE m_axi port=fc_w     bundle=WEI3     depth=640  offset=slave
    #pragma HLS INTERFACE m_axi port=fc_b     bundle=WEI3     depth=10   offset=slave
    #pragma HLS INTERFACE m_axi port=output   bundle=IMG_OUT  depth=10   offset=slave

    
    #pragma HLS INTERFACE s_axilite port=input    bundle=CTRL
    #pragma HLS INTERFACE s_axilite port=conv1_w  bundle=CTRL
    #pragma HLS INTERFACE s_axilite port=conv1_b  bundle=CTRL
    #pragma HLS INTERFACE s_axilite port=conv2_w  bundle=CTRL
    #pragma HLS INTERFACE s_axilite port=conv2_b  bundle=CTRL
    #pragma HLS INTERFACE s_axilite port=fc_w     bundle=CTRL
    #pragma HLS INTERFACE s_axilite port=fc_b     bundle=CTRL
    #pragma HLS INTERFACE s_axilite port=output   bundle=CTRL
    #pragma HLS INTERFACE s_axilite port=return   bundle=CTRL

    hls::stream<float> pix, mid1, mid2, mid3;
    
    #pragma HLS STREAM variable=pix  depth=64
    #pragma HLS STREAM variable=mid1 depth=64
    #pragma HLS STREAM variable=mid2 depth=64
    #pragma HLS STREAM variable=mid3 depth=64
    
    #pragma HLS DATAFLOW
    
    load_input(input, pix);
    conv1_stage(pix,    conv1_w, conv1_b, mid1);
    conv2_stage(mid1,   conv2_w, conv2_b, mid2);
    gap_stage(  mid2,               mid3);
    fc_stage(   mid3,   fc_w,    fc_b,    output);
}