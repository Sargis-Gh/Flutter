class AuthResult {
  final bool success;

  AuthResult({required this.success});
}

class ErrorResult extends AuthResult {
  final String errorMessage;

  ErrorResult({
    required super.success,
    required this.errorMessage,
  });
}

class User extends AuthResult {
  final String userName;
  final String accessToken;
  final List<String> chats;
  final String id;

  User({
    required super.success,
    required this.userName,
    required this.accessToken,
    required this.chats,
    required this.id,
  });
}
