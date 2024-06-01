import 'package:flutter/material.dart';
import 'package:verifactai/src/common/data/domain/domain.dart';
import 'package:verifactai/src/common/data/memory_manager.dart';
import 'package:verifactai/src/common/widgets/Chat/chat_widget.dart';
import 'package:verifactai/src/features/home/providers/user_provider.dart';

class DrawerProvider extends ChangeNotifier {
  static Future<void> clearAllHistory() async{
    MessageProvider().deleteHistory();
  }
  final List<String> _domains = [];
  List<String> get domains => List.unmodifiable(_domains);
  void _addDomain(String domainName) {
    _domains.add(domainName);
    notifyListeners();
  }
  void _removeDomain(String domainName){
    _domains.remove(domainName);
  }

  final List<ChatWidget> _chats = [];
  List<ChatWidget> get chats => List.unmodifiable(_chats);
  void addMessage(ChatWidget chat) {
    _chats.add(chat);
    notifyListeners();
  }

  Future<String> fullName() async {
    String result = await MemoryManager.getfullName();
    return result;
  }

  Future<void> addDomain(String domainName) async {
    final List<String> domains = await MemoryManager.getDomain();
    _addDomain(domainName);
    bool exists = domains.contains(domainName);
    if (!exists) {
      await MemoryManager.saveDomain([domainName]);
      final String fullName = await MemoryManager.getfullName();
      await Domain.sendDomain(
        fullName,
        domains,
      );
    }
  }

  Future<void> removeDomain(String domainName) async {
    final List<String> domains = await MemoryManager.getDomain();
    _removeDomain(domainName);
    await MemoryManager.deleteDomain(domainName);
    final String fullName = await MemoryManager.getfullName();
    await Domain.sendDomain(
      fullName,
      domains,
    );
  }
}
