// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:emuapp/users_pages/buttom_nav_bar.dart';
import 'package:flutter/material.dart';

class UserAccount extends StatelessWidget {
  const UserAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.indigo,
            Colors.indigoAccent,
          ],
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromARGB(235, 19, 47, 139),
          // appBar: AppBar(
          //   title: Text(
          //     'UNIVERSITÉ DE YAOUNDÉ I',
          //     style: TextStyle(color: Colors.white),
          //   ),
          //   centerTitle: true,
          //   backgroundColor: Colors.indigo,
          // ),
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Image("assets/images/2.jpg"),
                SizedBox(height: 10),
                Text(
                  'Vous etes sur l\'application mobile du departement d\'info\n Vous aller Login en tant que?',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                  child: Text('Etudiant'),
                ),
                // SizedBox(height: 15),
                // ElevatedButton(
                //   onPressed: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => Register(),
                //       ),
                //     );
                //   },
                //   child: Text('Enseignant'),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
