// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, avoid_print
import 'package:emuapp/providers/user_provider.dart';
import 'package:emuapp/users_pages/additional_pages/account_page.dart';
import 'package:emuapp/users_pages/authentication/login.dart';
import 'package:emuapp/users_pages/authentication/register.dart';
import 'package:emuapp/users_pages/buttom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'De-Com',
      routes: {
        '/signin': (context) => SignInPage(),
        '/signup': (context) => SignUpPage(),
        '/account': (context) => AccountPage(),
        '/home': (context) => HomePage(),
      },
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }
}
