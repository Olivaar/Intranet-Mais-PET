import 'dart:io';

import 'package:flutter/material.dart';

class User {
  String? userName;
  String? computerName;

  User(this.userName, this.computerName);

  retornarDados(){
    return userName = Platform.environment['USER'] ?? Platform.environment['USERNAME'];
  }

}