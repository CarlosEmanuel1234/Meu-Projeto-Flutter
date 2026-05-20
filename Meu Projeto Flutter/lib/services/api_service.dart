import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<Map<String, dynamic>> getCotacao() async {
    final response = await http.get(Uri.parse(
        "https://economia.awesomeapi.com.br/json/last/USD-BRL,EUR-BRL"));

    return jsonDecode(response.body);
  }
}
