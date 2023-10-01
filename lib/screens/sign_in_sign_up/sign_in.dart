import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/constants/sizes.dart';

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
                  height: 70,
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
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        builder: (context) => Container(
                          padding: const EdgeInsets.all(tDefaultSize),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tForgetPasswordTitle,
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                tForgetPasswordSubTitle,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const SizedBox(
                                height: 30.0,
                              ),
                              GestureDetector(
                                onTap: () => {},
                                child: Container(
                                  padding: const EdgeInsets.all(20.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.grey.shade200,
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.mail_outline_rounded,
                                        size: 40,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "E-Mail",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall,
                                          ),
                                          Text(
                                            tResetViaEMail,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () => {},
                                child: Container(
                                  padding: const EdgeInsets.all(20.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.grey.shade200,
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.mail_outline_rounded,
                                        size: 40,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Phone",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall,
                                          ),
                                          Text(
                                            tResetViaPhone,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: const Text(tForgetPassword),
                  ),
                ),
                SizedBox(
                  height: 40,
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
