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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
          child: Container(
        child: Column(children: <Widget>[
          SizedBox(
            height: size.height * 0.07,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: size.width * 0.4,
                height: size.height * 0.15,
                padding: EdgeInsets.only(
                    left: size.width * 0.03,
                    top: size.width * 0.02,
                    bottom: size.width * 0.02,
                    right: size.width * 0.03),
                margin: EdgeInsets.only(
                    left: size.width * 0.03,
                    bottom: size.width * 0.03,
                    right: size.width * 0.03),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(119, 187, 162, 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text("mm"),
              ),
              Container(
                width: size.width * 0.4,
                height: size.height * 0.15,
                padding: EdgeInsets.only(
                    left: size.width * 0.03,
                    top: size.width * 0.02,
                    bottom: size.width * 0.02,
                    right: size.width * 0.03),
                margin: EdgeInsets.only(
                    left: size.width * 0.03,
                    bottom: size.width * 0.03,
                    right: size.width * 0.03),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(119, 187, 162, 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ],
          )
        ]),
      )),
    );
  }
}
