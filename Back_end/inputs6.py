import numpy as np
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import MinMaxScaler
import tensorflow as tf
from sklearn.metrics import confusion_matrix, classification_report

# Load data from CSV
data = pd.read_csv('FloodPrediction.csv')

# Select relevant columns: Year, Month, Rainfall, Relative_Humidity, Wind_Speed, Cloud_Coverage, Flood?
selected_columns = ['Year', 'Month', 'Rainfall', 'Relative_Humidity', 'Wind_Speed', 'Cloud_Coverage', 'Flood?']
data = data[selected_columns]

# Handling missing values
data.fillna(data.mean(), inplace=True)  # Filling missing values with mean for continuous features

# Convert target variable to binary values
data['Flood?'] = (data['Flood?'] > 0).astype(int)  # Assuming 0 represents the absence of flood and 1 represents the presence of flood

# Split features and target variable
X = data.drop(columns=['Flood?'])
y = data['Flood?']

# Scaling features
scaler = MinMaxScaler(feature_range=(0, 1))
X_scaled = scaler.fit_transform(X)

# Reshape features for RNN input
X_rnn = X_scaled.reshape(X_scaled.shape[0], 1, X_scaled.shape[1])

# Splitting data into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X_rnn, y, test_size=0.2)

# Building RNN model
rnn_model = tf.keras.Sequential([
    tf.keras.layers.SimpleRNN(64, activation='relu', input_shape=(X_train.shape[1], X_train.shape[2])),
    tf.keras.layers.Dense(1, activation='sigmoid')
])
rnn_model.compile(optimizer='adam', loss='binary_crossentropy', metrics=['accuracy'])

# Training the model
history = rnn_model.fit(X_train, y_train, epochs=50, batch_size=32, validation_split=0.2)

# Evaluating the model
test_loss, test_accuracy = rnn_model.evaluate(X_test, y_test)
print(f'Test accuracy: {test_accuracy:.4f}')

# Making predictions
predictions = rnn_model.predict(X_test).flatten()

# Convert predictions to binary output
binary_predictions = (predictions > 0.5).astype(int)

# Display some sample predictions and their corresponding actual values
for i in range(10):
    print(f'Predicted: {binary_predictions[i]}, Actual: {y_test.iloc[i]}')

# Generate confusion matrix and classification report
conf_matrix = confusion_matrix(y_test, binary_predictions)
print("Confusion Matrix:")
print(conf_matrix)
print("\nClassification Report:")
print(classification_report(y_test, binary_predictions))

# Plot training and validation loss
plt.plot(history.history['loss'], label='Training Loss')
plt.plot(history.history['val_loss'], label='Validation Loss')
plt.title('Training and Validation Loss')
plt.xlabel('Epochs')
plt.ylabel('Loss')
plt.legend()
plt.show()

# Visualize predictions
plt.figure(figsize=(12, 6))
plt.plot(range(len(y_test)), y_test, color='blue', marker='o', linestyle='dashed', linewidth=2, markersize=5, label='Actual')
plt.plot(range(len(predictions)), binary_predictions, color='red', marker='x', linestyle='dashed', linewidth=2, markersize=5, label='Predicted')
plt.title('RNN Model Predictions vs Actual')
plt.xlabel('Sample Index')
plt.ylabel('Flood Prediction')
plt.legend()
plt.show()

# Save the trained model as a new H5 file
new_model_name = 'new_rnn_model.h5'
rnn_model.save(new_model_name)
print(f"New model saved as '{new_model_name}'")
