import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomButton extends StatelessWidget {
 final Function onPressed;
 final String text;
  const CustomButton({
    super.key,
     required this.onPressed,
     required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      child:  Text(text),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(liteYellow)),
    );
  }
}