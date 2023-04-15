import 'package:flutter/material.dart';

//*Colors
import 'package:closet_assist/constants/colors.dart' as color;

class PrimaryBtnDialogIcon extends StatelessWidget {
  const PrimaryBtnDialogIcon(
      {Key? key,
      required this.buttonText,
      required this.onPressedFunction,
      required this.bgColor,
      this.icon})
      : super(key: key);

  final String buttonText;
  final VoidCallback onPressedFunction;
  final Color bgColor;
  final IconData? icon;

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: color.textButton,
                size: 24,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                buttonText,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: color.textButton,
                ),
              ),
            ],
          )),
    );
  }
}
