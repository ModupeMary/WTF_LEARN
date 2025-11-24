import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wtf_hosp_app/bottom_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Save A Life",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        textTheme: GoogleFonts.robotoTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: BottomNavigation(),
    );
  }
}


