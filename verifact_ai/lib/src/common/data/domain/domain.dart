import 'dart:convert';
import 'package:http/http.dart' as http;

class Domain {
  static Future<bool> sendDomain(String fullName, List<String> domain) async {
    // Domain
    const apiUrl = 'https://web-production-ca59.up.railway.app/check';

    try {
      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode({
          'fullName': fullName,
          'domain': domain, // List
        }),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode >= 200 && response.statusCode < 301) {
        return true;
      }
      else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
