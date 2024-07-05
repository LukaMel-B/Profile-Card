import 'package:flutter/material.dart';
import 'package:instagram/controllers/login_controller.dart';

class LoginFunction {
  String login(
      {required String username,
      required String password,
      required BuildContext context}) {
    if (username == loginController.username &&
        password == loginController.password) {
      return 'Login Successfull';
    } else {
      if (username == loginController.username) {
        SnackbarMessage().snackBarMessage('Incorrect Password', context);
        return 'Incorrect Password';
      } else if (password == loginController.password) {
        SnackbarMessage().snackBarMessage('Incorrect Username', context);
        return 'Incorrect Username';
      } else {
        SnackbarMessage()
            .snackBarMessage('Incorrect Username & Password', context);
        return 'Incorrect Username & Password';
      }
    }
  }
}

class SnackbarMessage {
  snackBarMessage(String message, BuildContext context) {
    SnackBar snackBar = SnackBar(
      behavior: SnackBarBehavior.fixed,
      content: Text(
        message,
        style: TextStyle(
            fontFamily: 'Montserrat Bold',
            color: Colors.white,
            fontSize: (message.length <= 35) ? 14 : 12),
      ),
      backgroundColor: Colors.black,
      duration: Duration(milliseconds: (message.length <= 35) ? 3000 : 4000),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
