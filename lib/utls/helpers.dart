import 'package:flutter/material.dart';

mixin Helpers {

  showSnackBar({required BuildContext context, required String message, bool error = false }){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(8),
    backgroundColor: error ? Colors.red : Colors.green),);
  }
}
