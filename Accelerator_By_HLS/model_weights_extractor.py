from keras.models import load_model
import numpy as np
import os

model = load_model(r"C:\Users\Administrator\Desktop\EEE\saved_model\final_minimal_cnn.h5")


for layer in model.layers:
    weights = layer.get_weights()
    print(f"{layer.name}: {[w.shape for w in weights]}")


def save_layer_weights(model, layer_name, save_dir):
    layer = model.get_layer(name=layer_name)
    weights = layer.get_weights()
    
    if not weights:
        print(f"{layer_name} has no weights.")
        return
    
    kernel, bias = weights
    kernel_path = os.path.join(save_dir, f"{layer_name}_kernel.txt")
    bias_path = os.path.join(save_dir, f"{layer_name}_bias.txt")
    
    np.savetxt(kernel_path, kernel.flatten(), fmt="%.6f")
    np.savetxt(bias_path, bias.flatten(), fmt="%.6f")
    
    print(f"Saved weights for layer '{layer_name}' to:\n  {kernel_path}\n  {bias_path}")


save_dir = r"C:\Users\Administrator\Desktop\EEE\model_weights"
if not os.path.exists(save_dir):
    os.makedirs(save_dir)

save_layer_weights(model, "conv1", save_dir)
save_layer_weights(model, "conv2", save_dir)
save_layer_weights(model, "output", save_dir)
