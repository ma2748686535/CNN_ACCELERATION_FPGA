import h5py
import os
import cv2
import numpy as np
import matplotlib.pyplot as plt
from keras.applications.imagenet_utils import preprocess_input
from keras.models import Model, load_model
from keras.layers import Input, Conv2D, MaxPooling2D, Activation, GlobalAveragePooling2D, Dense
from keras.optimizers import RMSprop
from keras.callbacks import EarlyStopping, ModelCheckpoint
from collections import Counter

# File path setup
train_h5_path = r'C:\Users\Administrator\Desktop\EEE\TRAINING_INPUT\food_c101_n1000_r384x384x3.h5'
test_h5_path = r'C:\Users\Administrator\Desktop\EEE\TRAINING_INPUT\food_test_c101_n1000_r384x384x3.h5'

# Load data function
def load_h5_data(h5_path):
    with h5py.File(h5_path, 'r') as f:
        images = np.array(f['images'])
        labels = np.array(f['category'])
    return images, labels

#Load training and testing data
X_train, y_train = load_h5_data(train_h5_path)
X_test, y_test = load_h5_data(test_h5_path)

# Data preprocessing
X_train = np.array([cv2.resize(img, (224, 224)) for img in X_train])
X_test = np.array([cv2.resize(img, (224, 224)) for img in X_test])
X_train = preprocess_input(X_train)
X_test = preprocess_input(X_test)

# Convert labels to integer indices
y_train = np.argmax(y_train, axis=1)
y_test = np.argmax(y_test, axis=1)

# Visualize data distribution
train_counts = Counter(y_train)
plt.bar(train_counts.keys(), train_counts.values())
plt.title("Training Label Distribution")
plt.xlabel("Category")
plt.ylabel("Count")
plt.show()

# Build a minimal CNN model
def SimpleCNN(input_shape, classes):
    img_input = Input(shape=input_shape)

    # First Layer
    x = Conv2D(32, (3, 3), activation='relu', name='conv1')(img_input)
    x = MaxPooling2D(pool_size=(2, 2), name='pool1')(x)

    #Second Layer
    x = Conv2D(64, (3, 3), activation='relu', name='conv2')(x)
    x = MaxPooling2D(pool_size=(2, 2), name='pool2')(x)

    #Fully Connected Layer
    x = GlobalAveragePooling2D(name='global_avg_pool')(x)
    out = Dense(classes, activation='softmax', name='output')(x)

    #Build model
    model = Model(img_input, out, name='simple_cnn')
    return model


model_path = r"C:\Users\Administrator\Desktop\EEE\saved_model\final_minimal_cnn.h5"
if os.path.exists(model_path):
    print("加载已保存的模型 / Loading saved model...")
    model = load_model(model_path)
else:
    print("未找到已保存的模型，构建新模型 / No saved model found, building a new model...")
    model = SimpleCNN(input_shape=X_train.shape[1:], classes=len(np.unique(y_train)))
    model.compile(optimizer=RMSprop(learning_rate=1e-4), loss='sparse_categorical_crossentropy', metrics=['accuracy'])


early_stop = EarlyStopping(monitor='val_accuracy', patience=500, restore_best_weights=True)
checkpoint = ModelCheckpoint(
    model_path, monitor='val_accuracy', save_best_only=True, verbose=1
)


history = model.fit(
    X_train, y_train,
    validation_data=(X_test, y_test),
    batch_size=128,
    epochs=10 ,
    callbacks=[early_stop, checkpoint]
)


plt.figure(figsize=(12, 5))
plt.subplot(1, 2, 1)
plt.plot(history.history['loss'], label='Training Loss')
plt.plot(history.history['val_loss'], label='Validation Loss', linestyle='--')
plt.title("Loss over Epochs")
plt.xlabel("Epoch")
plt.ylabel("Loss")
plt.legend()
plt.subplot(1, 2, 2)
plt.plot(history.history['accuracy'], label='Training Accuracy')
plt.plot(history.history['val_accuracy'], label='Validation Accuracy', linestyle='--')
plt.title("Accuracy over Epochs")
plt.xlabel("Epoch")
plt.ylabel("Accuracy")
plt.legend()
plt.tight_layout()
plt.show()


predictions = model.predict(X_test[:16])
plt.figure(figsize=(12, 12))
for i in range(16):
    plt.subplot(4, 4, i + 1)
    plt.imshow(X_test[i].astype("uint8"))
    pred_label = np.argmax(predictions[i])
    true_label = y_test[i]
    plt.title(f"True: {true_label}\nPred: {pred_label}", color="green" if pred_label == true_label else "red")
    plt.axis("off")
plt.suptitle("Prediction Results", fontsize=16)
plt.show()


save_dir = r"C:\Users\Administrator\Desktop\EEE\saved_model"  


if not os.path.exists(save_dir):
    os.makedirs(save_dir)


model_path = os.path.join(save_dir, "final_minimal_cnn.h5")
model.save(model_path)
print(f"m/Module saved to {model_path}")

