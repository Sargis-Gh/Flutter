import 'package:flutter/material.dart';
import 'package:verifactai/src/content/app_content.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        top: false,
        bottom: false,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.onPrimaryContainer,
              ],
            ),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                  child: Center(
                      child: Text(
                AppContent.appName,
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w300),
              ))),
              SingnWidgets(),
            ],
          ),
        ),
      ),
    );
  }
}

class SingnWidgets extends StatelessWidget {
  const SingnWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 230,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withAlpha(250),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 40),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/signin');
            },
            style: ButtonStyle(
                foregroundColor: const WidgetStatePropertyAll(Colors.white),
                fixedSize: const WidgetStatePropertyAll<Size>(Size(270, 50)),
                backgroundColor: WidgetStatePropertyAll(Theme.of(context)
                    .colorScheme
                    .primaryContainer
                    .withAlpha(200))),
            child: const Text(
              'Մուտք',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 30),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/signup');
            },
            style: ButtonStyle(
                foregroundColor: WidgetStatePropertyAll(
                    Theme.of(context).colorScheme.surface),
                side: WidgetStatePropertyAll(BorderSide(
                    width: 3,
                    color: Theme.of(context)
                        .colorScheme
                        .primaryContainer
                        .withAlpha(200))),
                fixedSize: const WidgetStatePropertyAll<Size>(Size(270, 50)),
                backgroundColor: WidgetStatePropertyAll(
                    Theme.of(context).colorScheme.primary)),
            child: const Text(
              'Գրանցվել',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
