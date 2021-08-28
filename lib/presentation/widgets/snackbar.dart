import 'package:flutter/material.dart';

SnackBar successSnackbar(String message) {
  return SnackBar(
    elevation: 0.5,
    content: Text(
      message,
      style: TextStyle(
        color: Colors.white,
        fontFamily: 'Rubik',
      ),
    ),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.green,
  );
}

SnackBar errorSnackbar(String message) {
  return SnackBar(
    elevation: 0.5,
    content: Text(
      message,
      style: TextStyle(
        color: Colors.white,
        fontFamily: 'Rubik',
      ),
    ),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.red,
  );
}
