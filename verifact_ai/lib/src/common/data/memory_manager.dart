import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MemoryManager {
  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  // Function to save access token
  static Future<void> saveAccessToken(String accessToken) async {
    await _storage.write(key: 'access_token', value: accessToken);
  }

  // Function to retrieve access token
  static Future<String?> getAccessToken() async {
    return await _storage.read(key: 'access_token');
  }

  // Function to delete access token
  static Future<void> deleteAccessToken() async {
    await _storage.delete(key: 'access_token');
  }

  // Function to save fullName
  static Future<void> savefullName(String fullName) async {
    await _storage.write(key: 'fullName', value: fullName);
  }

  // Function to retrieve fullName
  static Future<String> getfullName() async {
    final String? fullName = await _storage.read(key: 'fullName');
    if (fullName != null) {
      return fullName;
    }
    return '';
  }

  // Function to delete fullName
  static Future<void> deletefullName() async {
    await _storage.delete(key: 'fullName');
  }

  // Save Chats id
  static Future<void> saveChatId(List<String> id) async {
    final String value = id.join(' ');
    await _storage.write(key: 'chatsID', value: value);
  }

  // Get Chats id
  static Future<List<String>> getChatId() async {
    final String? chatIdString = await _storage.read(key: 'chatsID');
    final List<String> result = chatIdString?.split(' ') ?? [];
    return result;
  }

  // Delete Chats id
  static Future<void> deleteChatId() async {
    await _storage.delete(key: 'chatsID');
  }

  static Future<void> deleteAll() async {
    await deleteChatId();
    await deleteAccessToken();
    await deletefullName();
    await deleteID();
    await deleteAllDomain();
  }

  // Get Domain
  static Future<List<String>> getDomain() async {
    final String? chatIdString = await _storage.read(key: 'domain');
    final List<String> result = chatIdString?.split(' ') ?? [];
    return result;
  }

  // Save Domain
  static Future<void> saveDomain(List<String> value) async {
    List<String> domains = await getDomain();
    domains.add(value.first);
    _storage.write(key: 'domain', value: domains.toString());
  }

  // Delete Domain
  static Future<void> deleteDomain(String value) async {
    List<String> domains = await getDomain();
    domains.remove(value);
    await saveDomain(domains);
  }

  // Delete All Domains
  static Future<void> deleteAllDomain() async {
    List<String> domains = await getDomain();
    domains = [];
    await saveDomain(domains);
  }

  static Future<void> saveID(String fullName) async {
    await _storage.write(key: 'id', value: fullName);
  }

  static Future<String> getID() async {
    final String? fullName = await _storage.read(key: 'id');
    if (fullName != null) {
      return fullName;
    }
    return '';
  }

  static Future<void> deleteID() async {
    await _storage.delete(key: 'id');
  }
}
