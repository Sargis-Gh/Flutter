import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:verifactai/src/common/core/config/back_url.dart';
import 'package:verifactai/src/common/data/auth_result_data.dart';

class AuthenticationResult {
  final bool success;
  final String? accessToken;
  final String? errorMessage;
  final Errors? error;

  AuthenticationResult({
    required this.success,
    this.accessToken,
    this.errorMessage,
    this.error,
  });
}

class Password {
  final bool isPasswordValid;
  final String? message;
  Password(this.message, {required this.isPasswordValid});
}

enum Errors { exists, authorized, unauthorized, wrongpassword }

class Auth {
  static String getPasswordErrorMessage(
      String password, String name, String fullName) {
    // Check if any of the fields are empty
    if (password.isEmpty || name.isEmpty || fullName.isEmpty) {
      return 'Please fill in all fields';
    }

    // Check if password length is at least 8 characters
    if (password.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    // Check if password contains at least one uppercase letter
    bool hasUppercase = false;
    for (int i = 0; i < password.length; i++) {
      if (password[i].toUpperCase() == password[i]) {
        hasUppercase = true;
        break;
      }
    }
    if (!hasUppercase) {
      return 'Password must contain at least one uppercase letter';
    }

    // Check if password contains at least one symbol
    final symbolPattern = RegExp(r'[^\w\s]');
    if (!symbolPattern.hasMatch(password)) {
      return 'Password must contain at least one symbol';
    }

    // Password meets all criteria
    return ''; // No error message
  }

  static Password isPasswordValid(String password) {
    // Check if password length is at least 8 characters
    if (password.length < 8) {
      return Password(
        'Password must be at least 8 characters long',
        isPasswordValid: false,
      );
    }

    // Check if password contains at least one uppercase letter
    bool hasUppercase = false;
    for (int i = 0; i < password.length; i++) {
      if (password[i].toUpperCase() == password[i]) {
        hasUppercase = true;
        break;
      }
    }
    if (!hasUppercase) {
      return Password(
        'Password must contain at least one uppercase letter',
        isPasswordValid: false,
      );
    }

    // Check if password contains at least one symbol
    final symbolPattern = RegExp(r'[^\w\s]');
    if (!symbolPattern.hasMatch(password)) {
      return Password(
        'Password must contain at least one symbol',
        isPasswordValid: false,
      );
    }

    // Password meets all criteria
    return Password(null, isPasswordValid: true);
  }

  // ----------------------
  // Sign Up Authentication
  // ----------------------
  static Future<AuthResult> signUp(
    String fullName,
    // String fullName,
    String password,
  ) async {
    const apiUrl = BackUrl.signUpUrl;

    try {
      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode({
          'fullName': fullName,
          // 'fullName': fullName,
          'password': password,
        }),
        headers: {'Content-Type': 'application/json'},
      );
      // print(response.statusCode);

      if (response.statusCode >= 200 && response.statusCode < 301) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final String accessToken = responseData['access_token'];
        final String fullName = responseData['user']['fullName'];
        // final List<Map<String, String>> userChats = responseData['user']['chats'];
        // List<String> chats = userChats.map((map) => map['id']!).toList();
        final String id = responseData['user']['id'];
        const bool success = true;
        final User user = User(
          success: success,
          userName: fullName,
          accessToken: accessToken,
          chats: [],
          id: id,
        );
        return user;
      } else if (response.statusCode == 500) {
        final String errorMessage = 'Failed to sign up: ${response.body}';
        final ErrorResult errorResult =
            ErrorResult(success: false, errorMessage: errorMessage);
        return errorResult;
      } else {
        // final String errorMessage = 'Failed to sign up: ${response.body}';
        const String errorMessage = 'Խնդրում ենք կրկին փորձել';
        final ErrorResult errorResult =
            ErrorResult(success: false, errorMessage: errorMessage);
        return errorResult;
      }
    } catch (e) {
      // final String errorMessage = 'Error: $e';
      const String errorMessage = 'Խնդրում ենք ստուգել ցանցի առկայությունը';
      final ErrorResult errorResult =
          ErrorResult(success: false, errorMessage: errorMessage);
      return errorResult;
    }
  }

  // ---------------------
  // Sign In Authentication
  // ---------------------
  static Future<AuthResult> signIn(String fullName, String password) async {
    const apiUrl = BackUrl.signInUrl;

    try {
      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode({'fullName': fullName, 'password': password}),
        headers: {'Content-Type': 'application/json'},
      );

      // print(response.statusCode);

      if (response.statusCode >= 200 && response.statusCode < 301) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final String accessToken = responseData['access_token'];
        final String fullName = responseData['user']['fullName'];
        // final List<dynamic> userChats = responseData['user']['chats'];
        // final List<String> chats = userChats.map((item) => item['id'] as String).toList();
        final String id = responseData['user']['id'];
        const bool success = true;
        final User user = User(
          success: success,
          userName: fullName,
          accessToken: accessToken,
          chats: [],
          id: id,
        );
        return user;
      } else if (response.statusCode == 401) {
        // Unauthorized
        const String errorMessage = 'Սխալ էլ. հասցե կամ գաղտնաբառ';
        final ErrorResult errorResult =
            ErrorResult(success: false, errorMessage: errorMessage);
        return errorResult;
      } else {
        // final String errorMessage = 'Failed to login: ${response.body}';
        const String errorMessage = 'Խնդրում ենք կրկին փորձել';
        final ErrorResult errorResult =
            ErrorResult(success: false, errorMessage: errorMessage);
        return errorResult;
      }
    } catch (e) {
      // final String errorMessage = 'Error: $e';
      const String errorMessage = 'Խնդրում ենք ստուգել ցանցի առկայությունը';
      final ErrorResult errorResult =
          ErrorResult(success: true, errorMessage: errorMessage);
      return errorResult;
    }
  }
}
