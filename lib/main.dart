import 'package:flutter/material.dart';
import 'package:valorant_api/Pages/HomePage.dart';
import 'package:valorant_api/UI_Helper/UI_Helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: UIHelper.BackColor,
          chipTheme: ChipThemeData(
            backgroundColor: UIHelper.BackColor,
            labelStyle: const TextStyle(color: Colors.white),
          ),
        ),
        home: HomePage());
  }
}
