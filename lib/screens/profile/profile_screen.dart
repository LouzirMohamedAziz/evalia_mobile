import 'package:flutter/material.dart';
import 'package:namer_app/constants/colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Profile',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          backgroundColor: mainEvaliaColor,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 80),
              CircleAvatar(
                radius: 60,
                backgroundColor:
                    mainEvaliaColor, // Replace with your image path
              ),
              SizedBox(height: 20),
              Text(
                'Mohamed Aziz LOUZIR', // Replace with the user's display name
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'medaziz.louzir@gmail.com', // Replace with user's email or other information
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20),
              // You can add more user information here
              // such as a bio, location, or other details
            ],
          ),
        ),
      ),
    );
  }
}
