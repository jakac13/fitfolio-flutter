import 'package:closet_assist/pages/account_page.dart';
import 'package:closet_assist/pages/main_framework.dart';
import 'package:closet_assist/provider/search_query_provider.dart';
import 'package:closet_assist/provider/category_dropdown_btn_provider.dart';
import 'package:closet_assist/provider/category_provider.dart';
import 'package:closet_assist/provider/google_sign_in.dart';
import 'package:closet_assist/provider/image_dowload_provider.dart';
import 'package:closet_assist/provider/image_path_provider.dart';
import 'package:closet_assist/provider/item_color_provider.dart';
import 'package:closet_assist/view_models/item_user_interaction_view_model.dart';
import 'package:closet_assist/view_models/items_view_model.dart';
import 'package:cyclop/cyclop.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/services.dart';
import 'pages/landing_page.dart';

import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'provider/selected_item_index.dart';

//!COLORS
const Color primary = Color(0XFF816acd);
const Color secondaryColor = Color(0XFFffd0da);
const Color textPrimary = Color(0xFF030003);
const Color textSecondary = Color(0xA6030003);
const Color textButton = Color(0xFFffffff);

Future main() async {
  WidgetsFlutterBinding.ensureInitialized(); //Firebase
  await Firebase.initializeApp(); // Firebase
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ImagePathProvider()),
        ChangeNotifierProvider(create: (_) => ImageDownloadProvider()),
        ChangeNotifierProvider(create: (_) => SelectedItemIndexProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => CategoryDropdownBtnProvider()),
        ChangeNotifierProvider(create: (_) => ItemColorProvider()),
        ChangeNotifierProvider(create: (_) => SearchQueryProvider()),
        ChangeNotifierProvider(create: (_) => GoogleSignInProvider()),
        ChangeNotifierProvider(create: (_) => ItemUserInteractionViewModel()),
        ChangeNotifierProvider(create: (_) => ItemsViewModel()),
      ],
      child: const MyApp(),
    ),
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, //Transparent status bar
  ));
}

/* ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(), */

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: EyeDrop(
        child: MaterialApp(
          debugShowCheckedModeBanner: false, //Skrije debug v appBar-u
          title: 'Fitfolio',
          theme: ThemeData(
              textTheme: TextTheme(
                displaySmall: GoogleFonts.nokora(
                    textStyle: const TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: textButton)),
                displayMedium: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: textPrimary)),
                titleLarge: GoogleFonts.poppins(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: textPrimary),
                bodyLarge: const TextStyle(fontSize: 16.0, color: textPrimary),
                bodyMedium: const TextStyle(fontSize: 14.0, color: textPrimary),
                bodySmall: const TextStyle(fontSize: 12.0),
              ),
              /* scaffoldBackgroundColor: #F3F3F3,
            dialogBackgroundColor: Colors.white, */
/*               colorSchemeSeed:
                  Colors.white, */ //Določiš, kateri barvi naj sledi tema
              useMaterial3: true,
              /* primarySwatch: Colors.deepPurple, */
              scaffoldBackgroundColor: textButton,
              appBarTheme: const AppBarTheme(
                  backgroundColor: textButton, foregroundColor: textPrimary)),
          home: const LandingPage(),
        ),
      ),
    );
  }
}
