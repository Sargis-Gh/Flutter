import 'package:flutter/material.dart';
import 'package:verifactai/src/features/first/first_screen.dart';
import 'package:verifactai/src/features/home/providers/drawer_provider.dart';

class UserNameWidget extends StatefulWidget {
  const UserNameWidget({
    super.key,
    required String iconChar,
    required String fullName,
  })  : _iconChar = iconChar,
        _fullName = fullName;

  final String _iconChar;
  final String _fullName;

  @override
  State<UserNameWidget> createState() => _UserNameWidgetState();
}

class _UserNameWidgetState extends State<UserNameWidget> {
  void _logout(BuildContext context) async {
    DrawerProvider.clearAllHistory();
    // MessageProvider().deleteHistory();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const FirstPage()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Text(widget._iconChar, style: const TextStyle(color: Colors.white),),),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            widget._fullName,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        IconButton(
            onPressed: () {
              _logout(context);
            },
            icon: const Icon(Icons.logout))
      ],
    );
  }
}
