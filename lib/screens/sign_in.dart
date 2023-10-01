import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants/images.dart';
import '../constants/texts.dart';
import '../reusable/evalia_main_title.dart';
import '../reusable/reusable_widget.dart';
import 'home_screen.dart';
import 'sign_up.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            // decoration: BoxDecoration(
            //     gradient: LinearGradient(colors: [
            //   Color.fromARGB(255, 132, 202, 240),
            //   Color.fromARGB(255, 53, 135, 206),
            //   Color.fromARGB(255, 7, 106, 160),
            //   Color.fromARGB(255, 13, 58, 82)
            // ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        30, MediaQuery.of(context).size.height * 0.13, 30, 0),
                    child: Column(
                      children: <Widget>[
                        Image(
                          image: AssetImage(tFullEvaliaImage),
                          width: 200,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        EvaliaTitleText(
                            text: slogan,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        SizedBox(
                          height: 70,
                        ),
                        Image(
                          image: AssetImage(tWelomeScreenImage),
                          width: 200,
                        ),
                        SizedBox(
                          height: 150,
                        ),
                        textField("Enter your E-mail", Icons.person_outline,
                            _emailTextController),
                        SizedBox(
                          height: 20,
                        ),
                        passwordtextField("Enter your Password",
                            Icons.lock_outline, true, _passwordTextController),
                        SizedBox(
                          height: 40,
                        ),
                        signInSignUpButton(context, true, () {
                          FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: _emailTextController.text,
                                  password: _passwordTextController.text)
                              .then((value) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage()));
                          }).onError((error, stackTrace) {
                            print("Error ${error.toString()}");
                          });
                        }),
                        SizedBox(
                          height: 20,
                        ),
                        signUpOption()
                      ],
                    )))));
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(signUpText,
            style: TextStyle(
                color: Color.fromRGBO(4, 79, 145, 1),
                fontSize: 18,
                fontWeight: FontWeight.w600)),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignUp()));
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(
                color: Color.fromRGBO(0, 75, 141, 1),
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        )
      ],
    );
  }
}
