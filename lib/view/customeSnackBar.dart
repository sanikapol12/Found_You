import 'package:flutter/material.dart';

class CustomSnackBars {
  showCustomSnackbar(
    BuildContext context,
    String message, {
    Color bgColor = Colors.green,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), backgroundColor: bgColor));
  }
}