import 'package:flutter/material.dart';

//*Colors
import 'package:closet_assist/constants/colors.dart' as color;

class PrimaryButtonDialog extends StatelessWidget {
  const PrimaryButtonDialog({
    Key? key,
    required this.buttonText,
    required this.onPressedFunction,
    required this.bgColor,
  }) : super(key: key);

  final String buttonText;
  final VoidCallback onPressedFunction;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.grey,
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            backgroundColor: bgColor,
            minimumSize: const Size.fromHeight(50),
          ),
          onPressed: onPressedFunction,
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: color.textButton,
            ),
          )),
    );
  }
}
