import 'dart:ffi';

class Account {
  final String accId;
  final String login;
  final String password;
  final Bool isActive;

  Account(this.accId, this.login, this.password, this.isActive);
}
