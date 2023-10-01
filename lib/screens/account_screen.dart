import 'package:flutter/material.dart';
import 'package:namer_app/constants/colors.dart';

class AccountPage extends StatefulWidget {
  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  // final TextEditingController _territoryTextController =
  //     TextEditingController();
  // final TextEditingController _displayTypeTextController =
  //     TextEditingController();
  // final TextEditingController _sectorNameTextController =
  //     TextEditingController();
  // final TextEditingController _performanceTextController =
  //     TextEditingController();
  // final TextEditingController _governorateTextController =
  //     TextEditingController();
  // final TextEditingController _temporalityTextController =
  //     TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final cardTextStyle = TextStyle(
    //   fontSize: 24,
    //   fontWeight: FontWeight.bold,
    //   color: Color.fromARGB(255, 255, 255, 255),
    // );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          backgroundColor: mainEvaliaColor,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 80),
              CircleAvatar(
                radius: 60,
                // backgroundImage: AssetImage('assets/user_avatar.jpg'),
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
