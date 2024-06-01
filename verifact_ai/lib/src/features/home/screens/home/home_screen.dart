import 'package:flutter/material.dart';
import 'package:verifactai/src/common/widgets/Chat/chat_widget.dart';
import 'package:verifactai/src/common/widgets/text_fileds/mesage_text_field.dart';
import 'package:verifactai/src/content/app_content.dart';
import 'package:verifactai/src/features/home/screens/drawer/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MainPageState();
}

class _MainPageState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      key: _scaffoldKey,
      appBar: AppBar(
        // foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: const Text(
          AppContent.appName,
        ),
      ),
      body: const Column(
        children: [
          Expanded(child: ChatWidget()),
          MessageWidget(),
        ],
      ),
      drawer: const MyDrawer(),
    );
  }
}
