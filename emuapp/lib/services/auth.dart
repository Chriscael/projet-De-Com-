// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:emuapp/utils/constants.dart';

// class AuthService {
//   //static const String baseUrl = 'http://127.0.0.1:8000';

//   Future<String> signUp(String name, String email, String password,
//       String confirmPassword) async {
//     final response = await http.post(
//       Uri.parse('${Constants.uri}/signup'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//       },
//       body: jsonEncode(<String, String>{
//         'name': name,
//         'email': email,
//         'password': password,
//         'confirmPassword': confirmPassword,
//       }),
//     );

//     if (response.statusCode == 201) {
//       return 'User registered successfully';
//     } else {
//       throw Exception('Failed to register user: ${response.body}');
//     }
//   }

//   Future<String> signIn(String email, String password) async {
//     final response = await http.post(
//       Uri.parse('${Constants.uri}/signin'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//       },
//       body: jsonEncode(<String, String>{
//         'email': email,
//         'password': password,
//       }),
//     );

//     if (response.statusCode == 200) {
//       return jsonDecode(response.body)['token'];
//     } else {
//       throw Exception('Failed to sign in: ${response.body}');
//     }
//   }

//   Future<String> logout(String token) async {
//     final response = await http.post(
//       Uri.parse('${Constants.uri}/logout'),
//       headers: <String, String>{
//         'Authorization': 'Bearer $token',
//       },
//     );

//     if (response.statusCode == 200) {
//       return 'Logged out successfully';
//     } else {
//       throw Exception('Failed to log out: ${response.body}');
//     }
//   }
// }
