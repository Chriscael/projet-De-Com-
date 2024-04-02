// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:emuapp/Lecturer_pages/authentication/register_lecturer.dart';
import 'package:emuapp/pre_account_page.dart';
import 'package:emuapp/utils/loading.dart';

class LoginLecturer extends StatefulWidget {
  const LoginLecturer({super.key});

  @override
  State<LoginLecturer> createState() => _LoginLecturerState();
}

class _LoginLecturerState extends State<LoginLecturer> {
  late String email, pass;
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Form(
              key: key,
              child: Column(
                children: [
                  Text(
                    'Login Lecturer',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    onChanged: (e) => email = e,
                    validator: (e) => e!.isEmpty ? "champ vide" : null,
                    decoration: InputDecoration(
                      hintText: "Entre votre mail",
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    obscureText: true,
                    onChanged: (e) => pass = e,
                    validator: (e) => e!.isEmpty
                        ? "champ vide"
                        : e.length < 6
                            ? "plus de 6 charac"
                            : null,
                    decoration: InputDecoration(
                      hintText: "Entre votre mon de pass",
                      labelText: "password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () async {
                      if (key.currentState!.validate()) {
                        loading(context);
                        print(email + "  " + pass);
                      }
                    },
                    child: Text('Sign In'),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Avez vous un compte?'),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterLecturer(),
                            ),
                          );
                        },
                        child: Text('Register'),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('pas le bon? Retourne choisir le'),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserAccount(),
                            ),
                          );
                        },
                        child: Text('status'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
