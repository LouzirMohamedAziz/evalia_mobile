import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/screens/sign_in_sign_up/forget_password_model_botton_sheet.dart';

import '../../constants/images.dart';
import '../../constants/texts.dart';
import '../../reusable/evalia_main_title.dart';
import '../../reusable/reusable_widget.dart';
import '../home_screen.dart';
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
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              30,
              MediaQuery.of(context).size.height * 0.13,
              30,
              0,
            ),
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
                  fontSize: 18,
                ),
                SizedBox(
                  height: 100,
                ),
                Image(
                  image: AssetImage(tWelomeScreenImage),
                  width: 250,
                ),
                SizedBox(
                  height: 50,
                ),
                textField(
                  "Enter your E-mail",
                  Icons.person_outline,
                  _emailTextController,
                ),
                SizedBox(
                  height: 20,
                ),
                passwordtextField(
                  "Enter your Password",
                  Icons.lock_outline,
                  true,
                  _passwordTextController,
                ),
                SizedBox(
                  height: 10,
                ),

                // FORGET PASSWORD TEXT BUTTON
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      ForgetPasswordScreen.buildShowModalBottomSheet(context);
                    },
                    child: const Text(tForgetPassword),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                signInSignUpButton(context, true, () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                    email: _emailTextController.text,
                    password: _passwordTextController.text,
                  )
                      .then((value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyHomePage(),
                      ),
                    );
                  }).catchError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                }),
                SizedBox(
                  height: 10,
                ),
                signUpOption(),
                SizedBox(
                  height: 40,
                ),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'Or, Continue as a ',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    TextSpan(
                        text: 'Guest.',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyHomePage(),
                              ),
                            );
                          }),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          signUpText,
          style: TextStyle(
            color: Color.fromRGBO(4, 79, 145, 1),
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignUp(),
              ),
            );
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(
              color: Color.fromRGBO(0, 75, 141, 1),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        )
      ],
    );
  }
}

class ForgetPasswordBtnWidget extends StatelessWidget {
  const ForgetPasswordBtnWidget({
    required this.btnIcon,
    required this.title,
    required this.subTitle,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final IconData btnIcon;
  final String title, subTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey.shade200,
        ),
        child: Row(
          children: [
            Icon(btnIcon, size: 50),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  subTitle,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
