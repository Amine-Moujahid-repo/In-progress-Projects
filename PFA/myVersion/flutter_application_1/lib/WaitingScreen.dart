import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_Screen_Chef_Project.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _progressValue = 0.0;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Timer.periodic(Duration(milliseconds: 500), (Timer timer) {
      setState(() {
        _progressValue += 0.2;
        if (_progressValue >= 1.0) {
          timer.cancel();
          navigateToHome();
        }
      });
    });
  }

  void navigateToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set your desired background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              './images/social-media.gif', // Replace with your own image asset
              width: 150,
              height: 150,
            ),
            SizedBox(height: 16),
            Text(
              'My App',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black, // Set your desired text color
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16), // Set the margin
              child: LinearProgressIndicator(
                value: _progressValue,
                backgroundColor: Colors.grey[300], // Set the background color of the progress bar
                valueColor: AlwaysStoppedAnimation<Color>(Colors.cyan), // Set the color of the progress bar
              ),
            ),
          ],
        ),
      ),
    );
  }
}
