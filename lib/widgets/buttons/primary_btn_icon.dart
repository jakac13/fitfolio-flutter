import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:closet_assist/provider/google_sign_in.dart';

//*Colors
import 'package:closet_assist/constants/colors.dart' as color;

class PrimaryButtonIcon extends StatelessWidget {
  const PrimaryButtonIcon(
      {Key? key,
      required this.buttonText,
      required this.onPressedFunction,
      required this.icon})
      : super(key: key);

  final String buttonText;
  final VoidCallback onPressedFunction;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
            backgroundColor: color.textPrimary,
            minimumSize: const Size.fromHeight(50)),
        onPressed: onPressedFunction,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              /* Icons.exit_to_app */
              icon,
              size: 18,
              color: color.textButton,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              buttonText,
              style: const TextStyle(
                  color: color.textButton,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ],
        ));
  }
}
