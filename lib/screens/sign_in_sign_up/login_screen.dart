import 'package:flutter/material.dart';
import 'package:namer_app/constants/images.dart';
import 'package:namer_app/constants/texts.dart';
import 'package:namer_app/screens/sign_in_sign_up/sign_in.dart';

import 'form_header_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Container(
                    child: Column(
      children: const [
        FormHeaderWidget(
          image: tForgetPasswordImage,
          title: tForgetPassword,
          subtitle: tForgetPasswordSubTitle,
          crossAxisAlignment: CrossAxisAlignment.center,
          heightBetween: 30.0,
          textAlign: TextAlign.center,
        ),
        SignIn(),
      ],
    )))));
  }
}
