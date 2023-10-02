import 'package:get/get.dart';

import '../entities/user.dart';
import '../repositories/authentication_repository.dart';
import '../repositories/user_repository.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  // Get USER Email And Pass to UserRepository
  getUserData() {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      _userRepo.getUserDetails(email);
    } else {
      Get.snackbar("Error", "Login to continue");
    }

    Future<List<User>> getAllUsers() async {
      return await _userRepo.allUsers();
    }
  }
}
