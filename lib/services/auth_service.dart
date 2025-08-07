import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  Future<String?> login(String email, String password) async {
    final url = Uri.parse('https://reqres.in/api/login');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json', 'x-api-key': 'reqres-free-v1'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    print('BODY: ${response.body}');

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      // Ritorno del token se l'accesso ha avuto successo
      return data["token"];
    } else {
      return null;
    }
  }
}
