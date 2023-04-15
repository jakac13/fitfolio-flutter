import 'package:closet_assist/pages/landing_page.dart';
import 'package:closet_assist/pages/login_page.dart';
import 'package:closet_assist/widgets/buttons/primary_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

//*Colors
import 'package:closet_assist/constants/colors.dart' as color;

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Image.asset(
                'images/register2.png',
                fit: BoxFit.contain,
                //width: double.infinity,
                /* height: 210, */
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Register",
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(
                  height: 20,
                ),
                const TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email))),
                const SizedBox(
                  height: 10,
                ),
                const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.password),
                    )),
                const SizedBox(
                  height: 10,
                ),
                const TextField(
                    decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Full Name',
                  prefixIcon: Icon(Icons.person),
                )),
                const SizedBox(
                  height: 10,
                ),
                Wrap(
                  children: [
                    Text(
                      "I agree to the ",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const Text(
                      "Terms & Conditions ",
                      style: TextStyle(
                          color: color.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    Text("and I agree to the ",
                        style: Theme.of(context).textTheme.bodySmall),
                    const Text(
                      "Privacy Policy",
                      style: TextStyle(
                          color: color.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                PrimaryButton(
                  buttonText: "Create An Account",
                  onPressedFunction: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const LandingPage();
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return const LoginPage();
                              },
                            ),
                          );
                        },
                        child: const Text('Sign In'))
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
