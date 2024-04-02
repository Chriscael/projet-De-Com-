// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, avoid_print, library_private_types_in_public_api

import 'package:emuapp/providers/user_provider.dart';
import 'package:emuapp/services/auth_services.dart';
import 'package:emuapp/users_pages/additional_pages/account_page.dart';
import 'package:emuapp/users_pages/authentication/register.dart';
import 'package:flutter/material.dart';
import 'package:emuapp/users_pages/academics.dart';
import 'package:emuapp/users_pages/additional_pages/menu.dart';
import 'package:emuapp/users_pages/student.dart';
import 'package:emuapp/users_pages/home.dart';
import 'package:emuapp/users_pages/formation.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService authService = AuthService();
  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  int _selectedIndex = 0;

  void _navigationBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    WelcomPage(),
    AcademicsPage(),
    UserFormation(),
    StudentPage(),
  ];

  @override
  Widget build(BuildContext context) {
    //final authProvider = Provider.of<AuthProvider>(context); // Access AuthProvider

    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        title: Text(
          'Computer Science Departement',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Provider.of<UserProvider>(context).user.token.isEmpty ? SignUpPage() : AccountPage(),
                ),
              );
            },
            icon: Icon(Icons.person_2_rounded),
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            backgroundColor: Colors.black38,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            gap: 8,
            padding: const EdgeInsets.all(16),
            tabs: const [
              GButton(icon: Icons.home_rounded, text: "Home"),
              GButton(icon: Icons.school_rounded, text: "MyAcademics"),
              GButton(icon: Icons.notifications_rounded, text: "Formation"),
              GButton(icon: Icons.person_2_rounded, text: "Profile"),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: _navigationBottomBar,
          ),
        ),
      ),
    );
  }
}
