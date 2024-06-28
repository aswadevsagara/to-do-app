import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';

class TextFields extends StatelessWidget {
  final int? minLines;
  final int? maxLines;
  final String? title;
  final double? fontSize;
  final double? verticalhgt;
  final TextEditingController controller;
  final GlobalKey? formKey;
  const TextFields({
    super.key,
    this.formKey,
    required this.minLines,
    required this.maxLines,
    required this.title,
    required this.fontSize,
    required this.verticalhgt,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "value is empty";
        } else {
          return null;
        }
      },
      controller: controller,
      keyboardType: TextInputType.multiline,
      minLines: minLines,
      maxLines: maxLines,
      decoration: InputDecoration(
          hintText: title,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: fontSize,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: verticalhgt!),
          
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: black),
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              )),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: liteYellow, width: 3),
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ))),
    );
  }
}
