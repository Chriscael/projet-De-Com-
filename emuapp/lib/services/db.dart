// // ignore_for_file: avoid_print, prefer_const_constructors, use_build_context_synchronously

// import 'dart:convert';

// import 'package:emuapp/model/pdf.dart';
// import 'package:emuapp/model/user.dart';
// import 'package:emuapp/users_pages/academics.dart';
// import 'package:emuapp/users_pages/additional_pages/account_page.dart';
// import 'package:emuapp/users_pages/authentication/login.dart';
// import 'package:emuapp/users_pages/buttom_nav_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class DBServices {
//   Future<void> signUp(User user, BuildContext context) async {
//     try {
//       var res = await http.post(
//         Uri.parse("http://127.0.0.1:8000/signup"),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: jsonEncode(<String, String>{
//           'name': user.name,
//           'email': user.email,
//           'password': user.password,
//           'confirmPassword': user.confirmPassword,
//         }),
//       );
//       print(res.body);
//       Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
//     } catch (error) {
//       print('Error occurred: $error');
//       // Handle error as needed
//     }
//   }

//   Future<void> signin(String email, String password, BuildContext context) async {
//   try {
//     var res = await http.post(
//       Uri.parse("http://127.0.0.1:8000/signin"),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, String>{
//         'email': email,
//         'password': password,
//       }),
//     );

//     if (res.statusCode == 200) {
//       // User found, navigate to account page or do something else
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => Account()),
//       );
//     } else if (res.statusCode == 404) {
//       // User not found, show error message
//       final Map<String, dynamic> responseData = json.decode(res.body);
//       final errorMessage = responseData['message'];
//       print(errorMessage); // You can also show this in a dialog
//     } else {
//       // Handle other status codes if needed
//       print('Unexpected status code: ${res.statusCode}');
//     }
//   } catch (error) {
//     print('Error occurred: $error');
//     // Handle error as needed
//   }
// }

//   Future<void> logout(BuildContext context) async {
//     try {
//       // Make a POST request to logout API
//       var response = await http.post(
//         Uri.parse("http://127.0.0.1:8000/logout"),
//         // You can add headers or tokens if needed
//       );

//       // Handle response, e.g., show a message or navigate to login page
//       if (response.statusCode == 200) {
//         // Logout successful
//         print('Logout successful');
//         // Navigate to login page or any other page
//         Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
//       } else {
//         // Logout failed
//         print('Logout failed: ${response.body}');
//       }
//     } catch (error) {
//       // Error occurred during logout process
//       print('Error occurred during logout: $error');
//     }
//   }

//   Future<void> generateReceipt(Pdf text, BuildContext context) async {
//     const url =
//         'http://127.0.0.1:8000/generatePDF'; // Remplacez ceci par l'URL de votre backend
//     final response = await http.post(
//       Uri.parse(url),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, String>{
//         'agence': text.agence,
//         'devise': text.devise,
//         'motif': text.motif,
//         'numeroTelephone': text.numeroTelephone,
//         'numeroOperation': text.numeroOperation,
//         'montant': text.montant,
//         'date': text.date,
//         'nomCommercant': text.nomCommercant,
//       }),
//     );

//     if (response.statusCode == 200) {
//       // Si la requête a réussi, vous pouvez afficher une confirmation
//       showDialog(
//         context: context,
//         builder: (_) => AlertDialog(
//           title: Text('Succès'),
//           content: Text('Le reçu a été généré avec succès !'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => AcademicsPage()));
//               },
//               child: Text('OK'),
//             ),
//           ],
//         ),
//       );
//     } else {
//       // Si la requête a échoué, vous pouvez afficher un message d'erreur
//       showDialog(
//         context: context,
//         builder: (_) => AlertDialog(
//           title: Text('Erreur'),
//           content:
//               Text('Une erreur est survenue lors de la génération du reçu.'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('OK'),
//             ),
//           ],
//         ),
//       );
//     }
//   }
// }
