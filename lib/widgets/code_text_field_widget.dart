import 'package:flutter/material.dart';
import 'package:super_store/utls/app_colors.dart';

class CodeTextField extends StatelessWidget {

  CodeTextField({required this.controller, required this.focusNode, required this.onChanged});

  final TextEditingController controller;
  final FocusNode focusNode;
  final void Function(String value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(child:
    TextField(
      textAlign: TextAlign.center,
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      keyboardType: TextInputType.number,
      maxLength: 1,
      decoration: const InputDecoration(
          counterText: '',
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black,)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.red))),
    ),);
  }

}