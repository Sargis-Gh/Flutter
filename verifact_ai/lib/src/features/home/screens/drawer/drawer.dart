// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:verifactai/src/features/home/providers/drawer_provider.dart';
import 'package:verifactai/src/features/home/screens/drawer/domain_widget.dart';
import 'package:verifactai/src/features/home/screens/drawer/user_name_widget.dart';

class MyDrawer extends StatefulWidget {
  // final UserProvider userProvider;
  const MyDrawer({
    super.key,
    // required this.userProvider,
  });

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String _fullName = '';
  // String _email = '';
  String _iconChar = '';

  @override
  void initState() {
    super.initState();
    _loadFullName();
  }

  Future<void> _loadFullName() async {
    _fullName = await DrawerProvider().fullName();
    _iconChar = _fullName[0];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        top: false,
        child: Column(
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              foregroundColor: Colors.white,
              backgroundColor: Theme.of(context).colorScheme.primary,
              title: const Text(
                'Պատմություն',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const AddDomainWidget(),
            const Expanded(child: DomainWidget()),
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: UserNameWidget(iconChar: _iconChar, fullName: _fullName),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddDomainWidget extends StatefulWidget {
  const AddDomainWidget({super.key});

  @override
  State<AddDomainWidget> createState() => _AddDomainWidgetState();
}

class _AddDomainWidgetState extends State<AddDomainWidget> {
  String domainName = '';
  @override
  Widget build(BuildContext context) {
    final drawerProvider = Provider.of<DrawerProvider>(context);
    final TextEditingController controller = TextEditingController();
    return Container(
      // padding: const EdgeInsets.only(left: 10),
      padding: const EdgeInsets.all(10),
      color: Theme.of(context).colorScheme.surface,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              // cursorColor: Colors.white,
              controller: controller,
              decoration: InputDecoration(
                // filled: true,
                fillColor: Theme.of(context).colorScheme.surface,
                hintText: 'Նախընտրելի կայք',
                // hintStyle: TextStyle(color: Colors.white)
              ),
              onChanged: (value) {
                domainName = value;
              },
            ),
          ),
          IconButton(
            style: ButtonStyle(
              iconColor: const WidgetStatePropertyAll(Colors.white),
              backgroundColor:
                  WidgetStatePropertyAll(Theme.of(context).colorScheme.primary),
            ),
            iconSize: 30,
            // color: Colors.white,
            onPressed: () async {
              if (controller.text != '') {
                await drawerProvider.addDomain(domainName);
                controller.clear();
              }
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
