// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:emuapp/users_pages/additional_pages/contact_page.dart';

class WelcomPage extends StatelessWidget {
  const WelcomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
            items: [
              _buildImageWithContent(
                'assets/images/1.jpg',
                'Title 1',
                'Description for image 1. Mauris ut dapibus velit cras\n interdum nisi ac. Tempor mollis. Pellentesque habitant \nmorbi tristique senectus et netus et malesuada fames ac turpis\n egestas.',
                () => Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUs())),
              ),
              _buildImageWithContent(
                'assets/images/2.jpg',
                'Title 2',
                'Description for image 2. Mauris ut dapibus velit cras i\nnterdum nisi ac. Tempor mollis. Pellentesque habitant morbi \ntristique senectus et\n netus et malesuada fames ac turpis \negestas.',
                () => Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUs())),
              ),
              _buildImageWithContent(
                'assets/images/3.jpg',
                'Title 3',
                'Description for image 3. Mauris ut dapibus velit cras \ninterdum nisi ac. Tempor mollis. Pellentesque habitant morbi\n tristique senectus et netus et malesuada fames ac turpis egestas.',
                () => Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUs())),
              ),
            ],
            options: CarouselOptions(
              height: 225.0,
              autoPlay: true,
              aspectRatio: 16 / 9,
              viewportFraction: 1.0,
            ),
          ),
          Container(
            color: Colors.indigo,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Request a call back right now?",
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(height: 10.0),
                Text(
                  "Le département d'informatique dispense les enseignements d'informatique dans toutes les filières de la Faculté des Sciences",
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUs())),
                  child: Text('CONTACT US'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Presentation General',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5.0),
                Text(
                  'ALIQUAM ID URNA IMPERDIET LIBERO MOLLIS HENDRERIT',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(height: 10.0),
                Image.asset('assets/images/4.jpg'),
                SizedBox(height: 5.0),
                Text(
                  'Les enseignements d’Informatique ont démarré à la Faculté des Sciences de l’Université de Yaoundé en 1978. A la faveur de la convention tripartite signée entre l’Université des Nations Unies (UNU), l’Institut National de Recherche en Informatique et Automatique (INRIA) et l’Université de Yaoundé I en 1985, la Maîtrise a démarré, suivie l’année d’après par le cycle de Doctorat.',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Les Formations',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'LE DEPARTEMENT OFFRE DEUX TYPES DE FORMATIONS',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
          Card(
            margin: EdgeInsets.all(16.0),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'ICT4D',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Information and Communication Technologies For Development!',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    '"Nulla ullamcorper, ipsum vel condimentum congue, mi odio vehicula tellus, sit amet malesuada justo sem sit amet quam. Pellentesque in sagittis lacus."',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageWithContent(String imagePath, String title, String description, Function onPressed) {
    return Stack(
      children: [
        Image.asset(imagePath, fit: BoxFit.cover, width: double.infinity),
        Positioned(
          top: 20.0,
          left: 16.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
              SizedBox(height: 5.0),
              Text(
                description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () => onPressed(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                ),
                child: Text(
                  title,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
