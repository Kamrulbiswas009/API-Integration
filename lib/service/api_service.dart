import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<void> signup(String name, String email, String password) async {
    final url = Uri.parse('http://13.204.75.28:5056/users/register');

    final payload = {
      "name": name,
      "email": email,
      "password": password,
      "authProvider": "EMAIL",
    };

    final headers = {"Content-Type": "application/json"};

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(payload),
    );

    final responseBody = jsonDecode(response.body);
    print("body is $responseBody");

    if (response.statusCode == 200 || response.statusCode == 201) {
      Get.snackbar('Success', 'Signup successful');
    } else {
      Get.snackbar('Error', responseBody['message'] ?? 'Signup failed');
    }
  }
}
