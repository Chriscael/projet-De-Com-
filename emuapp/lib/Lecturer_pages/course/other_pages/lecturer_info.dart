// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AddArticles extends StatefulWidget {
  const AddArticles({super.key});

  @override
  State<AddArticles> createState() => _AddArticlesState();
}

class _AddArticlesState extends State<AddArticles> {
  final key = GlobalKey<FormState>();
  late String name, courseTutor, email, telephone, role;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Add information about your self",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  onChanged: (e) => name = e,
                  validator: (e) => e!.isEmpty ? "champ vide" : null,
                  decoration: InputDecoration(
                    hintText: "Enter your name",
                    labelText: "name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  onChanged: (e) => courseTutor = e,
                  validator: (e) => e!.isEmpty ? "champ vide" : null,
                  decoration: InputDecoration(
                    hintText: "Enter the course you lecture",
                    labelText: "Course Tutor",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  onChanged: (e) => email = e,
                  validator: (e) => e!.isEmpty ? "champ vide" : null,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Enter your email addresse",
                    labelText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  onChanged: (e) => telephone = e,
                  validator: (e) => e!.isEmpty ? "champ vide" : null,
                  decoration: InputDecoration(
                    hintText: "Enter your telephone number",
                    labelText: "Telephone",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  onChanged: (e) => role = e,
                  validator: (e) => e!.isEmpty ? "champ vide" : null,
                  decoration: InputDecoration(
                    hintText: "Enter your Role in the department",
                    labelText: "Role",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Wrap(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      color: Colors.indigo,
                      child: Icon(Icons.hdr_plus_rounded),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    if (key.currentState!.validate()) {}
                  },
                  child: Text('Add Your info'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
