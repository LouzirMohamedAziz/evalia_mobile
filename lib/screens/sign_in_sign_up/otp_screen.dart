import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:namer_app/constants/texts.dart';

import '../../controllers/otp_controller.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var otp;
    return Scaffold(
      body: Container(
          padding: EdgeInsets.fromLTRB(
              30, MediaQuery.of(context).size.height * 0.13, 30, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(tOtpTile,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 80.0,
                  )),
              Text(tOtpSubTitle.toUpperCase(),
                  style: Theme.of(context).textTheme.headlineMedium),
              SizedBox(height: 40.0),
              Text("$tOtpMessage medaziz.louzir@gmail.com",
                  textAlign: TextAlign.center),
              SizedBox(height: 20.0),
              OtpTextField(
                  numberOfFields: 6,
                  fillColor: Colors.black.withOpacity(0.1),
                  filled: true,
                  onSubmit: (code) {
                    otp = code;
                    OTPController.instance.verifyOTP(otp);
                  }),
              SizedBox(height: 20.0),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        OTPController.instance.verifyOTP(otp);
                      },
                      child: const Text("TEXT"))),
            ],
          )),
    );
  }
}
