// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, avoid_print
import 'package:flutter/material.dart';
import 'package:emuapp/Lecturer_pages/course/other_pages/add_article.dart';

class LecHome extends StatefulWidget {
  const LecHome({super.key});

  @override
  State<LecHome> createState() => _LecHomeState();
}

class _LecHomeState extends State<LecHome> {
  @override
  Widget build(BuildContext context) {
    final List<MenuData> menu = [
      MenuData(
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddArticles(),
                  ),
                );
              },
              icon: Icon(Icons.school_rounded)),
          'Add Acticles'),
      MenuData(
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications_rounded)),
          'Add Activities'),
      MenuData(
          IconButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => CourseForm(),
                //   ),
                // );
              },
              icon: Icon(Icons.assignment_turned_in_outlined)),
          'Add Courses'),
      MenuData(
          IconButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => (),
                //   ),
                // );
              },
              icon: Icon(Icons.assignment_turned_in_outlined)),
          'Courses'),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mr Chris',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(
            onPressed: () async {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Deconnexion'),
                      content: Text('Do you want to Log Out?'),
                      actions: [
                        TextButton(
                          onPressed: () async {},
                          child: Text('Yes'),
                        ),
                        TextButton(
                          onPressed: () async {
                            Navigator.of(context).pop();
                          },
                          child: Text('No'),
                        ),
                      ],
                    );
                  });
            },
            icon: Icon(Icons.person_2_rounded),
          ),
        ],
      ), //
      body: Container(
        padding: EdgeInsets.all(4.0),
        child: Scrollbar(
          thickness: 3,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Welcome, to the home page\n What do you want to do Now?',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: menu.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1,
                        crossAxisCount: 2,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0),
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        elevation: 0.2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: InkWell(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              IconButton(
                                onPressed: () {},
                                iconSize: 40,
                                icon: menu[index].icon,
                              ),
                              SizedBox(height: 20),
                              Text(
                                menu[index].title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black87),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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

class MenuData {
  MenuData(this.icon, this.title);
  final IconButton icon;
  final String title;
}
