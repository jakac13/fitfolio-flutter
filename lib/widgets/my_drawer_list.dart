import 'package:closet_assist/widgets/buttons/primary_btn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:closet_assist/provider/google_sign_in.dart';

//*Colors
import 'package:closet_assist/constants/colors.dart' as color;

class MyDrawerList extends StatefulWidget {
  const MyDrawerList({super.key});

  @override
  State<MyDrawerList> createState() => _MyDrawerListState();
}

class _MyDrawerListState extends State<MyDrawerList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      /* padding: const EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 20,
      ), */
      child: Column(
        children: [
          PrimaryButton(
            buttonText: "LOG OUT",
            onPressedFunction: () {
              final provider = Provider.of<GoogleSignInProvider>(
                context,
                listen: false,
              );
              provider.googleLogout();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
