// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables, unnecessary_null_comparison

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:emuapp/users_pages/additional_pages/receipt.dart';
import 'package:emuapp/users_pages/additional_pages/view_pdf.dart';
import 'package:emuapp/users_pages/additional_pages/article.dart';

class AcademicsPage extends StatefulWidget {
  const AcademicsPage({super.key});

  @override
  State<AcademicsPage> createState() => _AcademicsPageState();
}

class _AcademicsPageState extends State<AcademicsPage> {
  @override
  Widget build(BuildContext context) {
    final List<MenuItem> items = [
      MenuItem(
        AssetImage("assets/images/1.jpg"),
        'Mindfulness',
        () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserArticle(),
          ),
        ),
      ),
      MenuItem(
        AssetImage("assets/images/2.jpg"),
        'Sadfulness',
        () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReceiptGenerator(),
          ),
        ),
      ),
    ];

    final List<MenuData> menu = [
      MenuData(
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserArticle(),
                ),
              );
            },
            icon: Icon(Icons.school_rounded, size: 40, color: Colors.blue),
          ),
          'Articles'),
      MenuData(
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReceiptGenerator(),
                  ),
                );
              },
              icon: Icon(Icons.notifications_rounded,
                  size: 40, color: Colors.green)),
          'Receipt Generator'),
      MenuData(
          IconButton(
              onPressed: () {
                GlobalKey<FormState> key = GlobalKey<FormState>();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PDFViewer(
                      pdfId: '',
                      key: key,
                    ),
                  ),
                );
              },
              icon: Icon(Icons.assignment_turned_in_outlined,
                  size: 40, color: Colors.orange)),
          'View your PDF'),
    ];

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Scrollbar(
          thickness: 3,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GridView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: menu.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0),
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            menu[index].icon,
                            SizedBox(height: 10),
                            Text(menu[index].title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey[900])),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 16),
                Text('other pages'),
                SizedBox(height: 16),
                GridView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: items.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1,
                      crossAxisCount: 2,
                      crossAxisSpacing: 0.5,
                      mainAxisSpacing: 0.5),
                  itemBuilder: (BuildContext context, int index) {
                    return SafeArea(
                      child: CupertinoButton(
                        child: Container(
                          height: 300,
                          width: 300,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: items[index].image,
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Container(
                            margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
                            child: Text(
                              items[index].title,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        onPressed: () => items[index].navigateToNextPage(context),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MenuData {
  MenuData(this.icon, this.title);
  final IconButton icon;
  final String title;
}

class MenuItem {
  MenuItem(this.image, this.title, this.onPressed);
  final AssetImage image;
  final String title;
  final VoidCallback onPressed;

  void navigateToNextPage(BuildContext context) {
    if (onPressed != null) {
      onPressed(); // Call the provided onPressed function
    } else {
      // Handle potential case where onPressed is not set:
      // - Show a message or provide alternative behavior
      print('No navigation function defined for this MenuItem.');
    }
  }
}



