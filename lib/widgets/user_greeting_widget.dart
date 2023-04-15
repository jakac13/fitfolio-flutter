import 'dart:developer';
import 'package:closet_assist/pages/account_page.dart';
import 'package:closet_assist/provider/selected_item_index.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

//*Firebase
import 'package:firebase_auth/firebase_auth.dart';

//*Pages
import 'package:closet_assist/pages/register_page.dart';
import 'package:closet_assist/pages/account_page.dart';

import 'package:google_fonts/google_fonts.dart';

//*Widgets
import 'package:closet_assist/widgets/my_drawer.dart';
import 'package:closet_assist/widgets/my_drawer_list.dart';
import 'package:closet_assist/widgets/buttons/primary_btn_dialog.dart';
import 'package:closet_assist/widgets/buttons/secondary_btn_dialog.dart';
import 'package:closet_assist/widgets/add_item/add_item_texform_field.dart';
import 'package:closet_assist/widgets/add_item/add_item_dropdown_btn.dart';

//*Classes
import 'package:closet_assist/models/item.dart';

//*Colors
import 'package:closet_assist/constants/colors.dart' as color;

class UserGreetingWidget extends StatefulWidget {
  const UserGreetingWidget({super.key});

  @override
  State<UserGreetingWidget> createState() => _UserGreetingWidgetState();
}

class _UserGreetingWidgetState extends State<UserGreetingWidget> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    var userFullName = user.displayName!.split(" ");
    var userName = userFullName[0];
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              children: [
                Text(
                  'Hello, ',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  "$userName 👋",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const AccountPage();
                    },
                  ),
                );
              },
              child: Stack(children: [
                Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: color.textPrimary.withOpacity(
                            0.2), // you can change the border color
                        width: 2, // you can change the border width
                      ),
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.0),
                        child: Image.network(user.photoURL!, height: 40))),
              ]),
            ),
          ],
        ),
      ],
    );
  }
}
