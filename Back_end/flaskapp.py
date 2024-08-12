from flask import Flask, request, jsonify
from flask_cors import CORS
import numpy as np
import pandas as pd
import tensorflow as tf
from sklearn.preprocessing import MinMaxScaler

app = Flask(__name__)
CORS(app)

# Load the trained model
model = tf.keras.models.load_model('new_rnn_model.h5')

# Load data for scaling
data = pd.read_csv('FloodPrediction.csv')
feature_names = ['Year', 'Month', 'Rainfall', 'Relative_Humidity', 'Wind_Speed', 'Cloud_Coverage']

# Function to scale input features
def scale_features(features, data):
    scaler = MinMaxScaler(feature_range=(0, 1))
    data_features = data[feature_names].copy()  # Only use the features defined in feature_names
    scaler.fit(data_features)
    scaled_features = scaler.transform([features])
    return scaled_features

@app.route('/predict', methods=['POST'])
def predict():
    req_data = request.get_json()
    features = [req_data[feature] for feature in feature_names]
    
    # Scale the input features
    scaled_inputs = scale_features(features, data)
    print(f"Scaled inputs: {scaled_inputs}")  # Debugging: print scaled inputs
    X_rnn_input = scaled_inputs.reshape(1, 1, -1)
    
    # Predict flood
    prediction = model.predict(X_rnn_input).flatten()
    print(f"Raw prediction: {prediction}")  # Debugging: print raw prediction
    binary_prediction = int(prediction > 0.5)
    
    return jsonify({'prediction': 'Flood' if binary_prediction else 'No Flood'})

if __name__ == '__main__':
    app.run(debug=True)
