import 'dart:io';

import 'package:closet_assist/pages/login_page.dart';
import 'package:closet_assist/pages/register_page.dart';
import 'package:closet_assist/widgets/buttons/primary_btn.dart';
import 'package:closet_assist/widgets/buttons/secondary_btn.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

//*Colors
import 'package:closet_assist/constants/colors.dart' as color;

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    statusBarColor:
    Colors.transparent;
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: color.textButton,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/image1.jpg'),
              scale: 1.0,
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  color.textPrimary.withOpacity(0.5),
                  color.textPrimary.withOpacity(0.1)
                ],
                transform: const GradientRotation(4.5),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  /* Expanded(
                    child: Image.asset(
                      'images/home1.jpg',
                      scale: 1.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ), */
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        /* color: Colors.transparent, */
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 15),
                      child: Column(
                        children: [
                          /* Text(
                            'FITFOLIO',
                            style: Theme.of(context).textTheme.displaySmall,
                          ), */
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "images/logonobg.png",
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('"Your wardrobe, just a tap away."',
                              /* Your closet, simplified. */
                              style: TextStyle(
                                  fontSize: 16, color: color.textButton)),
                          const SizedBox(
                            height: 30,
                          ),
                          SecondaryButton(
                            buttonText: "GET STARTED",
                            onPressedFunction: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return const LoginPage();
                                  },
                                ),
                              );
                            },
                          ),
                          /* const SizedBox(
                            height: 10,
                          ),
                          SecondaryButton(
                            buttonText: "Create An Account",
                            onPressedFunction: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return const RegisterPage();
                                  },
                                ),
                              );
                            },
                          ), */
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}


/* Expanded(
                child: Container(
                  height: 330,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 20),
                    child: Column(
                      children: [
                        Expanded(
                          child: Text(
                            'ClosetAssist',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ),
                        Text('"Your wardrobe, just a tap away."',
                            /* Your closet, simplified. */
                            style: Theme.of(context).textTheme.bodyMedium),
                        const SizedBox(
                          height: 40,
                        ),
                        PrimaryButton(
                          buttonText: "Sign In",
                          onPressedFunction: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return const LoginPage();
                                },
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SecondaryButton(
                          buttonText: "Create An Account",
                          onPressedFunction: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return const RegisterPage();
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ), */