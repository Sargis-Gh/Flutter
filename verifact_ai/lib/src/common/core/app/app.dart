import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:verifactai/src/features/first/first_screen.dart';
import 'package:verifactai/src/features/sign/screens/signin_screen.dart';
import 'package:verifactai/src/features/home/screens/home/home_screen.dart';
import 'package:verifactai/src/features/sign/screens/signup_screen.dart';
import 'package:verifactai/src/thems/theme.dart';
import 'package:verifactai/src/thems/theme_provider.dart';
import 'package:verifactai/src/common/data/memory_manager.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeProvider>(context).themeData,
      darkTheme: darkMode,
      title: 'Flutter Login Example',
      // home: const AppStart(), // Using AppStart instead of initialRoute
      initialRoute: '/',
      routes: {
        '/': (context) => const AppStart(),
        '/signin': (context) => const LoginPage(),
        '/signup': (context) => const RegisterPage(),
        'home_screen': (context) => const HomeScreen(),
      },
    );
  }
}

class AppStart extends StatelessWidget {
  const AppStart({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: MemoryManager.getAccessToken(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While waiting for the access token to be fetched,
          // you can show a loading indicator or splash screen.
          return const CircularProgressIndicator();
        } else {
          if (snapshot.hasData && snapshot.data != null) {
            // Access token exists, navigate to main page
            return const HomeScreen();
          } else {
            // No access token found, navigate to login page
            return const FirstPage();
          }
        }
      },
    );
  }
}
