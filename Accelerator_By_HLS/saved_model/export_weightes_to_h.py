import h5py
import numpy as np

model_path = 'C:/Users/Administrator/Desktop/EEE/saved_model/final_minimal_cnn.h5'  
output_dir = 'C:/Users/Administrator/Desktop/EEE/saved_model/weights_h'             

import os
if not os.path.exists(output_dir):
    os.makedirs(output_dir)

def save_array_to_header(arr, varname, filename):
    with open(filename, 'w') as f:
        dims = ''.join(f'[{d}]' for d in arr.shape)
        f.write(f'float {varname}{dims} = {{\n')
        flat = arr.flatten()
        for i, val in enumerate(flat):
            f.write(f'{val:.8f}')
            if i != len(flat) - 1:
                f.write(', ')
            if (i + 1) % 8 == 0:
                f.write('\n')
        f.write('\n};\n')

with h5py.File(model_path, 'r') as f:
    print("Layer names:", list(f['model_weights'].keys()))
    # Conv1
    conv1_w = np.array(f['model_weights']['conv1']['conv1']['kernel:0'])
    conv1_b = np.array(f['model_weights']['conv1']['conv1']['bias:0'])
    save_array_to_header(conv1_w, 'conv1_w', f'{output_dir}/conv1_w.h')
    save_array_to_header(conv1_b, 'conv1_b', f'{output_dir}/conv1_b.h')

    # Conv2
    conv2_w = np.array(f['model_weights']['conv2']['conv2']['kernel:0'])
    conv2_b = np.array(f['model_weights']['conv2']['conv2']['bias:0'])
    save_array_to_header(conv2_w, 'conv2_w', f'{output_dir}/conv2_w.h')
    save_array_to_header(conv2_b, 'conv2_b', f'{output_dir}/conv2_b.h')

    # Dense
    fc_w = np.array(f['model_weights']['output']['output']['kernel:0'])
    fc_b = np.array(f['model_weights']['output']['output']['bias:0'])
    save_array_to_header(fc_w, 'fc_w', f'{output_dir}/fc_w.h')
    save_array_to_header(fc_b, 'fc_b', f'{output_dir}/fc_b.h')

print("✅ All weights have been exported as .h files, located in the folder.：", output_dir)
