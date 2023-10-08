import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String? id;
  final String fullName;
  final String email;
  final String phoneNo;
  final String password;

  const User({
    this.id,
    required this.fullName,
    required this.email,
    required this.phoneNo,
    required this.password,
  });

  toJson() {
    return {
      "FullName": fullName,
      "Email": email,
      "Phone": phoneNo,
      "Password": password,
    };
  }

  factory User.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return User(
        id: document.id,
        fullName: data?["RatingComment"],
        email: data?["Score"],
        phoneNo: data?["Rater"],
        password: data?["Professional"]);
  }
}
