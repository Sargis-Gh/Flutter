import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:verifactai/src/common/core/app/app.dart';
import 'package:verifactai/src/features/home/providers/drawer_provider.dart';
import 'package:verifactai/src/features/home/providers/user_provider.dart';
import 'package:verifactai/src/features/sign/providers/sign_provider.dart';
import 'package:verifactai/src/thems/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => SignProvider()),
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => DrawerProvider()),
      ChangeNotifierProvider(create: (context) => MessageProvider()),
    ],
    child: const App(),
  ));
}


  // hetq.am
  // azatutyun.am
  // civilnet.am
  // infocom.am
  // media.am
  // fip.am
  // aravot.am
  // news.am
  // shant.news
  // 1lurer.am

  // amin info

  // havasti info

  // global info

  // Revue users weights

  // Fake
  // perfecttv
  // mamul.am