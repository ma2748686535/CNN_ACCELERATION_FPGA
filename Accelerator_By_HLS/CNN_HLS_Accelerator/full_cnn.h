#pragma once

void full_cnn(
    float input[224][224][3],
    float output[101],
    float conv1_w[3][3][3][32], float conv1_b[32],
    float conv2_w[3][3][32][64], float conv2_b[64],
    float fc_w[64][101], float fc_b[101]
);
