// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables

import 'package:emuapp/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      color: Colors.white,
      width: 300,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              user.name,
              style: TextStyle(color: Colors.black),
            ),
            accountEmail: Text(
              user.email,
              style: TextStyle(color: Colors.black),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/images/2.jpg"),
            ),
            decoration: BoxDecoration(
              color: Colors.indigo, // Set the background color to indigo
            ),
          ),
        ],
      ),
    );
  }
}
