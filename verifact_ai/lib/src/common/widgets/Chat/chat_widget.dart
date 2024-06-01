import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:verifactai/src/features/home/providers/user_provider.dart';

class ChatWidget extends StatefulWidget {
  final String name = 'Chat 1';
  const ChatWidget({
    super.key,
  });

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  @override
  Widget build(BuildContext context) {
    final messageProvider = Provider.of<MessageProvider>(context);
    return ListView.builder(
      itemCount: messageProvider.history.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: messageProvider.history[index],
        );
      },
    );
  }
}
