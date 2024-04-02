// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'dart:io';

import 'package:flutter/material.dart';
//import 'package:myapp/utils/get_image.dart';

class AddArticles extends StatefulWidget {
  const AddArticles({super.key});

  @override
  State<AddArticles> createState() => _AddArticlesState();
}

class _AddArticlesState extends State<AddArticles> {
  final key = GlobalKey<FormState>();
  late String title, description;
  late List<File> images;
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
                  "Add an Article to the page",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  onChanged: (e) => title = e,
                  validator: (e) => e!.isEmpty ? "champ vide" : null,
                  decoration: InputDecoration(
                    hintText: "Enter the title of the article",
                    labelText: "Title",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  onChanged: (e) => description = e,
                  validator: (e) => e!.isEmpty ? "champ vide" : null,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Enter the description of the article",
                    labelText: "Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Wrap(
                  children: [
                      Container(
                        height: 60,
                        width: 60,
                        //child: Image.file(images),
                      ),
                    InkWell(
                      onTap: () async {
                        // final data = await showModalBottomSheet(
                        //     context: context,
                        //     builder: (context) {
                        //       return GetImage();
                        //     });
                        // setState(() {
                        //   image;
                        // });
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        color: Colors.indigo,
                        child: Icon(Icons.hdr_plus_rounded),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    if (key.currentState!.validate()) {}
                  },
                  child: Text('Add Article'),
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
