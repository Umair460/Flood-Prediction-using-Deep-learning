How to Run the Flood Prediction Project
Prerequisites
Ensure that you have Python, Flask, Flutter, and ADB installed on your system.
Place the required CSV file in the same directory as the project files.
Steps to Run the Project
Run the Data Processing Script:

First, run the input6.py file to process the data.
Ensure the CSV file is saved in the same folder as input6.py.
Start the Flask Server:

Run the Flask server. This will generate the new_rnn_model.h5 file required for predictions.
Set Up Flutter:

Install Flutter on your system if you haven't already.
Make sure to also install ADB (Android Debug Bridge) for running the Flutter app.
Run the Flutter App:

Navigate to the Flutter project directory.
Ensure the Flask server is running before proceeding.
Build the project by running the Gradle build process.
Reverse TCP Port:

Open the command prompt and enter the following command to reverse the TCP port:
lua
Copy code
adb reverse tcp:5000 tcp:5000
Run the App:

After setting up the TCP reverse, run your Flutter app.
