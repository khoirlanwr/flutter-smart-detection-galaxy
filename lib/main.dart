import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smart_detector/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Smart Detection',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme:
              // GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              GoogleFonts.montserratTextTheme(Theme.of(context).textTheme)
          // textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
          ),
      home: HomePage(),
    );
  }
}
