import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

//*Widgets
import 'package:closet_assist/widgets/my_drawer.dart';
import 'package:closet_assist/widgets/my_drawer_list.dart';
import 'package:closet_assist/widgets/buttons/primary_btn_dialog.dart';
import 'package:closet_assist/widgets/buttons/secondary_btn_dialog.dart';
import 'package:closet_assist/widgets/add_item/add_item_texform_field.dart';
import 'package:closet_assist/widgets/add_item/add_item_dropdown_btn.dart';

//*Colors
import 'package:closet_assist/constants/colors.dart' as color;

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            );
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40.0),
                    child: Image.network(user.photoURL!),
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
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            //* Na Container sem dal Expanded widget, da Container zavzame cel možen prostor na zaslonu in le toliko kot so veliki child elementi.
            Expanded(
              child: Container(
                  decoration: const BoxDecoration(
                    /* color: Colors.white, */
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Informacije o accountu."),
                        MyDrawerList(),
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
