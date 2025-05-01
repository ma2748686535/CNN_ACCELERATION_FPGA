#include "full_cnn_opt.h"
#include <iostream>
#include <iomanip>

using namespace std;

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

int main() {
    // 分配内存
    static float input [IMG_H * IMG_W * IMG_C];
    static float conv1_w[CO1 * K1 * K1 * IMG_C];
    static float conv1_b[CO1];
    static float conv2_w[CO2 * K2 * K2 * CI2];
    static float conv2_b[CO2];
    static float fc_w   [CO2 * CLS];
    static float fc_b   [CLS];
    static float output [CLS];

    // 初始化输入和权重/偏置
    cout << "Initializing data..." << endl;
    for (int i = 0; i < IMG_H*IMG_W*IMG_C; i++) 
        input[i] = 1.0f;

    for (int i = 0; i < CO1*K1*K1*IMG_C; i++)
        conv1_w[i] = 0.01f; 
        
    for (int i = 0; i < CO1; i++)
        conv1_b[i] = 0.0f;

    for (int i = 0; i < CO2*K2*K2*CI2; i++)
        conv2_w[i] = 0.01f;

    for (int i = 0; i < CO2; i++)
        conv2_b[i] = 0.0f;

    for (int i = 0; i < CO2*CLS; i++)
        fc_w[i] = 0.01f;

    for (int i = 0; i < CLS; i++)
        fc_b[i] = 0.0f;

    cout << "Running CNN..." << endl;
    full_cnn_opt(input, output, conv1_w, conv1_b, conv2_w, conv2_b, fc_w, fc_b);
        
    cout << "Output Scores:" << endl;
    for (int i = 0; i < CLS; i++) {
        cout << setprecision(4) << fixed << output[i];
        if (i < CLS - 1) 
            cout << ", ";
    }
    cout << endl;
    
    // 计算参考结果
    float expected = 0.01f * 3 * 3 * 3 * 0.01f * 3 * 3 * 32 * 64;
    cout << "Expected Scores: " << expected << endl;

    return 0;
}