import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/repositories/user_repository.dart';
import 'package:namer_app/screens/sign_in_sign_up/otp_screen.dart';

import '../entities/user.dart';
import '../repositories/authentication_repository.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();

  final userRepo = Get.put(UserRepository());

  void registerUser(String email, String password) {
    String? error = AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password) as String?;
    if (error != null) {
      Get.showSnackbar(GetSnackBar(
        message: error.toString(),
      ));
    }
  }

  Future<void> createUser(User user) async {
    await userRepo.createUser(user);
    phoneAuthentication(user.phoneNo);
    Get.to(() => const OTPScreen());
  }
}
