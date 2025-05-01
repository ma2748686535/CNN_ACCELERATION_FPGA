import h5py
import os
import cv2
import numpy as np
import matplotlib.pyplot as plt
from keras.applications.imagenet_utils import preprocess_input
from keras import backend as K
from keras.layers import Input, DepthwiseConv2D, Conv2D, MaxPooling2D, Activation, concatenate, Dropout, GlobalAveragePooling2D
from keras.models import Model
from keras.optimizers import RMSprop
import tensorflow as tf
from tensorflow_model_optimization.sparsity.keras import prune_low_magnitude, strip_pruning, UpdatePruningStep
import tensorflow_model_optimization as tfmot

interpreter = tf.lite.Interpreter(model_path="optimized_food_model_quantized.tflite")
interpreter.allocate_tensors()

# 获取输入和输出张量信息
input_details = interpreter.get_input_details()
output_details = interpreter.get_output_details()

print("Input details:", input_details)
print("Output details:", output_details)

# 运行推理
test_sample = np.expand_dims(X_test[0], axis=0)  # 测试样本
interpreter.set_tensor(input_details[0]['index'], test_sample)
interpreter.invoke()
prediction = interpreter.get_tensor(output_details[0]['index'])
print("Prediction:", prediction)
