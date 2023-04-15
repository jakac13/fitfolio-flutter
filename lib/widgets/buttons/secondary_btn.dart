import 'package:flutter/material.dart';

//*Colors
import 'package:closet_assist/constants/colors.dart' as color;

class SecondaryButton extends StatelessWidget {
  const SecondaryButton(
      {Key? key, required this.buttonText, required this.onPressedFunction})
      : super(key: key);

  final String buttonText;
  final VoidCallback onPressedFunction;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.grey,
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          backgroundColor: Colors.white,
          minimumSize: const Size.fromHeight(50),
        ),
        onPressed: onPressedFunction,
        child: Text(
          buttonText,
          style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color.textPrimary),
        ));
  }
}
