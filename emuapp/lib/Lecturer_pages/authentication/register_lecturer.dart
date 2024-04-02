// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, prefer_interpolation_to_compose_strings, avoid_print, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:emuapp/utils/loading.dart';

class RegisterLecturer extends StatefulWidget {
  RegisterLecturer({super.key});

  @override
  State<RegisterLecturer> createState() => _RegisterLecturerState();
}

class _RegisterLecturerState extends State<RegisterLecturer> {
  late String email, pass, confirmPass, name;
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register lecturer',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Form(
              key: key,
              child: Column(
                children: [
                  Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    onChanged: (e) => name = e,
                    validator: (e) => e!.isEmpty ? "champ vide" : null,
                    decoration: InputDecoration(
                      hintText: "Entre votre nom",
                      labelText: "Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
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
                      hintText: "Entre votre mot de pass",
                      labelText: "password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    obscureText: true,
                    onChanged: (e) => confirmPass = e,
                    validator: (e) => e!.isEmpty
                        ? "champ vide"
                        : e.length < 6
                            ? "plus de 6 charac"
                            : null,
                    decoration: InputDecoration(
                      hintText: "confirmer mot de pass",
                      labelText: "confirm password",
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
                    child: Text('Sign Up'),
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
