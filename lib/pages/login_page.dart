import 'dart:developer';

import 'package:closet_assist/pages/main_framework.dart';
import 'package:closet_assist/pages/register_page.dart';
import 'package:closet_assist/provider/google_sign_in.dart';
import 'package:closet_assist/widgets/login_widget.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

//*Firebase
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

//*Colors
import 'package:closet_assist/constants/colors.dart' as color;

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /* appBar: AppBar(), */
        resizeToAvoidBottomInset: false,
        body: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                final user = FirebaseAuth.instance.currentUser!;
                DatabaseReference databaseReference =
                    FirebaseDatabase.instance.ref();
                final userUID = user.uid;

                //* Spremenljive za določanje trenutnega datuma. Date sem sestavil v string, ker date je objekt...
                DateTime now = new DateTime.now();
                DateTime date = DateTime(now.year, now.month, now.day);

                String dateString = "${date.day}-${date.month}-${date.year}";
                inspect(dateString);
                databaseReference
                    .child("/users/$userUID/accountInformation")
                    .set(
                  {
                    'name': user.displayName,
                    'email': user.email,
                    'joined': dateString
                  },
                );

                /*    print('User email: ${user.email}');
                print('User UID: ${user.uid}'); */

                return const MainFramework();
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text("Something went wrong"),
                );
              } else {
                return const LogInWidget();
              }
            }));
  }
}
