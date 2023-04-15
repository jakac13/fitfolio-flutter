import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

//*Colors
import 'package:closet_assist/constants/colors.dart' as color;

class MyHeaderDrawer extends StatelessWidget {
  const MyHeaderDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            /* color: Colors.white, */
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        )),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(user.photoURL!),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              user.displayName!,
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              )),
            ),
            Text(
              user.email!,
              style: const TextStyle(
                  color: color.textPrimary,
                  fontWeight: FontWeight.normal,
                  fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
