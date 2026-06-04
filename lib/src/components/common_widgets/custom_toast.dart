import 'package:flutter/material.dart';
import 'package:chatapp/main.dart';

class CustomToast {
  static void show({
    required String message,
    bool isError = false,
  }) {
    scaffoldMessengerKey.currentState?.clearSnackBars();
    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: isError ? Colors.red.shade700 : Colors.green.shade700,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}