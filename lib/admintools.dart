import 'package:canteen/backgrounds/signup_bg.dart';
import 'package:flutter/material.dart';

class toolspage extends StatefulWidget {
  const toolspage({super.key});

  @override
  State<toolspage> createState() => _toolspageState();
}

class _toolspageState extends State<toolspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
          child: Container(
        child: Column(children: <Widget>[
          Row(
            children: <Widget>[],
          )
        ]),
      )),
    );
  }
}
