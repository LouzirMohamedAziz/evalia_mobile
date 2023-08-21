import 'dart:ffi';

import 'entiti.dart';

class Account {
  final String accId;
  final String login;
  final String password;
  final Bool isActive;
  final Entity entity;

  Account(this.accId, this.login, this.password, this.isActive, this.entity);
}
