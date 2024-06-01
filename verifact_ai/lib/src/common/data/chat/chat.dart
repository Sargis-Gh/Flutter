import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:verifactai/src/common/core/config/back_url.dart';
import 'package:verifactai/src/common/data/chat/aianswer.dart';

class Chat {
  static Future<AiAnswer> send(String facebookLink, String fullName) async {
    const apiUrl = BackUrl.chatUrl;

    try {
      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode({
          'fullName': fullName,
          'link': facebookLink,
        }),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode >= 200 && response.statusCode < 301) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final List<dynamic> messages = responseData['messages'];
        final Map<String, dynamic> aiAnswer = messages[1];
        final Map<String, dynamic> officialNews = aiAnswer['officialNews'];
        final Map<String, dynamic> promptData =
            await officialNews['promptData'];
        final List<dynamic> resultData = await officialNews['resultData'];

        final Map<String, dynamic> anyNews = aiAnswer['anyNews'];
        final List<dynamic> anyNewsResultData = anyNews['resultData'];

        final AiAnswer answer = AiAnswer(
          success: 'true',
          promptData: promptData,
          resultData: resultData,
          anyNewsResultData: anyNewsResultData,
        );
        return answer;
      } else {
        return AiAnswer(
          success: 'false',
          promptData: {'': ''},
          resultData: [],
          anyNewsResultData: [],
        );
      }
    } catch (e) {
      return AiAnswer(
        success: 'false',
        promptData: {'': ''},
        resultData: [],
        anyNewsResultData: [],
      );
    }
  }
}
