import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import 'features/splash/presentation/pages/splash_page.dart';
import 'locator.dart' as locator;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  locator.getSetupLocator();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: const Color(0xffdc0a2d),
      title: 'Pokedex',
      theme: ThemeData(
        primaryColor: const Color(0xffdc0a2d),
        cardColor: const Color(0xffdedede),
        indicatorColor: const Color(0xff28aaff),
        shadowColor: const Color(0xff89021e),
        hintColor: const Color(0xfff5e32e),
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xff53ae5f),
        ),
        backgroundColor: const Color(0xffdc0a2d),
      ),
      home: const Splash(),
    );
  }
}
