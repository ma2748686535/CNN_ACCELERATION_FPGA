#ifndef FULL_CNN_OPT_H
#define FULL_CNN_OPT_H

#ifdef __cplusplus
extern "C" {
#endif

void full_cnn_opt(
    const float *input,
    float       *output,
    const float *conv1_w,
    const float *conv1_b,
    const float *conv2_w,
    const float *conv2_b,
    const float *fc_w,
    const float *fc_b
);

#ifdef __cplusplus
}
#endif

#endif // FULL_CNN_OPT_H