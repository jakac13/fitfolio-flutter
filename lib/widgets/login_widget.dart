import 'package:closet_assist/pages/main_framework.dart';
import 'package:closet_assist/pages/register_page.dart';
import 'package:closet_assist/provider/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:closet_assist/widgets/buttons/primary_btn.dart';

//*Colors
import 'package:closet_assist/constants/colors.dart' as color;

class LogInWidget extends StatelessWidget {
  const LogInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Image.asset(
                'images/login2.png',
                fit: BoxFit.contain,
                //width: double.infinity,
                /* height: 210, */
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sign In",
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 20,
                ),
                const TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black38),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email))),
                const SizedBox(
                  height: 10,
                ),
                const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(15),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black38),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.password),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forgot Password?",
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                PrimaryButton(
                  buttonText: "Sign In",
                  onPressedFunction: () {},
                ),
                const SizedBox(
                  height: 10,
                ),
                Divider(
                  color: Colors.grey.shade300,
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.grey,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        backgroundColor: Colors.grey.shade100,
                        minimumSize: const Size.fromHeight(50)),
                    onPressed: () {
                      final provider = Provider.of<GoogleSignInProvider>(
                          context,
                          listen: false);
                      provider.googleLogin();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'icons/google.png',
                          height: 24,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Sign in with Google",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: color.textPrimary),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("New to ClosetAssist?"),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return const RegisterPage();
                              },
                            ),
                          );
                        },
                        child: const Text('Register'))
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
