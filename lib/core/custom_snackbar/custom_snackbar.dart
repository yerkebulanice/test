import 'package:flutter/material.dart';

void showCustomSnackBar({required BuildContext context, required String title}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(title, style: const TextStyle(color: Colors.white, fontSize: 20.0)),
      duration: const Duration(milliseconds: 1500),
      width: 200.0,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      backgroundColor: Colors.red,
    ),
  );
}
