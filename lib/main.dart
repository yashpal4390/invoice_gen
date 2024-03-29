// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invoice_gen/splash_screen.dart';
import 'pdf_screen.dart';
import 'constant.dart';
import 'home_page.dart';
void main()
{
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        splashScreenRoute: (context) => SplashScreen(),
        homePage: (context) => HomePage(),
        pdfScreenRoute: (context) => PDFscreen(),
      },
    );
  }
}

