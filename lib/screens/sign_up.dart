import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../reusable/reusable_widget.dart';
import 'home_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _firstNameTextController = TextEditingController();
  TextEditingController _lastNameTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Sign UP'),
        titleTextStyle:
            TextStyle(color: Color.fromARGB(255, 205, 234, 243), fontSize: 30),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 92, 173, 216),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 132, 202, 240),
            Color.fromARGB(255, 53, 135, 206),
            Color.fromARGB(255, 7, 106, 160),
            Color.fromARGB(255, 13, 58, 82)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 60,
                ),
                textField("Enter First Name", Icons.person_outline, false,
                    _firstNameTextController),
                SizedBox(
                  height: 20,
                ),
                textField("Enter Last Name", Icons.person_outline, false,
                    _lastNameTextController),
                SizedBox(
                  height: 20,
                ),
                textField("Enter E-MAIL", Icons.person_outline, false,
                    _emailTextController),
                SizedBox(
                  height: 20,
                ),
                passwordtextField("Enter Your Password", Icons.lock_outline,
                    true, _passwordTextController),
                SizedBox(
                  height: 30,
                ),
                signInSignUpButton(context, bool, true, () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                    email: _emailTextController.text,
                    password: _passwordTextController.text,
                  )
                      .then(
                    (value) {
                      print("Account created successfuly!");
                    },
                  );
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHomePage()));
                })
              ],
            ),
          ))),
    );
  }
}
