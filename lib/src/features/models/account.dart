import 'dart:ffi';

class Account {
  final Long accId;
  final String login;
  final String password;
  final Bool isActive;

  Account(this.accId, this.login, this.password, this.isActive);
}
