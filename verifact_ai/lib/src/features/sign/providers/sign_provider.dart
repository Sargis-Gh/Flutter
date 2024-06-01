import 'package:flutter/material.dart';
import 'package:verifactai/src/common/data/auth_result_data.dart';
import 'package:verifactai/src/common/data/memory_manager.dart';
import 'package:verifactai/src/common/data/sign_in_up.dart';
import 'package:verifactai/src/features/home/screens/home/home_screen.dart';

class SignProvider extends ChangeNotifier {
  String _userName = '';
  String get userName => _userName;
  set userName(String value) {
    _userName = value;
    notifyListeners();
  }

  String _password = '';
  String get password => _password;
  set password(String value) {
    _password = value;
    notifyListeners();
  }

  String _confirmPassword = '';
  String get confirmPassword => _confirmPassword;
  set confirmPassword(String value) {
    _confirmPassword = value;
    notifyListeners();
  }

  String _errorMessage = '';
  String get errorMessage => _errorMessage;
  set errorMessage(String value) {
    _errorMessage = value;
    notifyListeners();
  }

  String _passwordErrorMessage = '';
  String get passwordErrorMessage => _passwordErrorMessage;
  set passwordErrorMessage(String value) {
    _passwordErrorMessage = value;
    notifyListeners();
  }

  Future<bool> signUp(
    String userName,
    String password,
    BuildContext context,
  ) async {
    AuthResult result;

    result = await Auth.signUp(
      userName,
      password,
    );
    if (result.success) {
      result as User;
      MemoryManager.saveAccessToken(result.accessToken);
      MemoryManager.savefullName(result.userName);
      MemoryManager.saveChatId(result.chats);
      MemoryManager.saveID(result.id);
      Navigator.pushAndRemoveUntil(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
        (Route<dynamic> route) => false,
      );
    } else {
      result as ErrorResult;
      errorMessage = result.errorMessage;
    }
    return result.success;
  }

  Future<bool> signIn(
    String fullName,
    String password,
    BuildContext context,
  ) async {
    AuthResult result = await Auth.signIn(fullName, password);
    if (result.success) {
      MemoryManager.deleteChatId();
      result as User;
      MemoryManager.saveAccessToken(result.accessToken);
      MemoryManager.savefullName(result.userName);
      MemoryManager.saveChatId(result.chats);
      MemoryManager.saveID(result.id);
      Navigator.pushAndRemoveUntil(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
        (Route<dynamic> route) => false,
      );
    } else {
      result as ErrorResult;
      errorMessage = result.errorMessage;
    }
    return result.success;
  }
}
