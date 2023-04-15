import 'package:flutter/material.dart';

//*Colors
import 'package:closet_assist/constants/colors.dart' as color;

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
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
          backgroundColor: color.textPrimary,
          minimumSize: const Size.fromHeight(50),
        ),
        onPressed: onPressedFunction,
        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: color.textButton,
          ),
        ));
  }
}
