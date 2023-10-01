import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/constants/images.dart';
import 'package:namer_app/constants/texts.dart';
import 'package:namer_app/controllers/sign_up_controller.dart';
import 'package:namer_app/reusable/evalia_main_title.dart';
import 'package:namer_app/screens/sign_in_sign_up/sign_in.dart';

import '../../constants/colors.dart';
import '../../reusable/reusable_widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   title: Text('Sign UP'),
      //   titleTextStyle:
      //       TextStyle(color: Color.fromARGB(255, 205, 234, 243), fontSize: 30),
      //   centerTitle: true,
      //   backgroundColor: Color.fromARGB(255, 92, 173, 216),
      // ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.15, 20, 0),
            child: Form(
              key: _formKey,
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
                      text: slogan, fontWeight: FontWeight.bold, fontSize: 18),
                  SizedBox(
                    height: 100,
                  ),
                  Text("Let's Sign You Up !",
                      style: TextStyle(
                        color: mainEvaliaColor,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  textField(
                      "Full Name", Icons.person_outline, controller.fullname),
                  SizedBox(
                    height: 20,
                  ),
                  textField(
                      "Phone Number", Icons.person_outline, controller.phoneNo),
                  SizedBox(
                    height: 20,
                  ),
                  textField("E-Mail", Icons.person_outline, controller.email),
                  SizedBox(
                    height: 20,
                  ),
                  passwordtextField("Password", Icons.lock_outline, true,
                      controller.password),
                  SizedBox(
                    height: 70,
                  ),
                  signInSignUpButton(context, false, () {
                    if (_formKey.currentState!.validate()) {
                      SignUpController.instance.registerUser(
                          controller.email.text.trim(),
                          controller.password.text.trim());
                    }
                    // FirebaseAuth.instance
                    //     .createUserWithEmailAndPassword(
                    //   email: controller.email.text,
                    //   password: controller.password.text,
                    // )
                    //     .then(
                    //   (value) {
                    //     print("Account created successfuly!");
                    //   },
                    // );
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => MyHomePage()));
                  }),
                  SizedBox(
                    height: 10,
                  ),
                  signInOption()
                ],
              ),
            ),
          ))),
    );
  }

  Row signInOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(signInText,
            style: TextStyle(
                color: Color.fromRGBO(4, 79, 145, 1),
                fontSize: 17,
                fontWeight: FontWeight.w600)),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignIn()));
          },
          child: const Text(
            "  Sign In",
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
