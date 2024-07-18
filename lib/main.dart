import 'package:canteen/admintools.dart';
import 'package:canteen/config/config.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textSelectionTheme: const TextSelectionThemeData(
        selectionHandleColor: Color.fromRGBO(60, 121, 98, 1.0),
      )),
      title: "Canteen App",
      debugShowCheckedModeBanner: false,
      home: toolspage(),
    );
  }
}
