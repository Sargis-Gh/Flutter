import 'package:flutter/material.dart';

class SarchChatWidget extends StatefulWidget {
  const SarchChatWidget({super.key});

  @override
  State<SarchChatWidget> createState() => _SarchChatWidgetState();
}

class _SarchChatWidgetState extends State<SarchChatWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.all(10),
      child: const TextField(
              // onChanged: _filterSearchResults,
              decoration: InputDecoration(
                // labelText: 'Որոնել',
                hintText: 'Որոնել',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
              ),
            ),
    );
  }
}