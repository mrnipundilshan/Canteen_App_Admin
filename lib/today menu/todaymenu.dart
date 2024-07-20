import 'dart:convert';
import 'package:canteen/backgrounds/signup_bg.dart';
import 'package:canteen/config/config.dart';
import 'package:canteen/users/usercard.dart';
import 'package:canteen/users/userclass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class todaymenu extends StatefulWidget {
  todaymenu({super.key});

  @override
  State<todaymenu> createState() => _todaymenuState();
}

class _todaymenuState extends State<todaymenu> {
  DateTime dateTime = DateTime.now();
  bool? vegischeck = true;
  bool? fishischeck = true;
  bool? chickenischeck = true;
  bool? eggischeck = true;
  bool? kottuischeck = true;
  bool? riceischeck = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Background(
          child: Column(children: [
        SizedBox(
          height: size.height * 0.08,
        ),
        newMethod(size)
      ])),
    );
  }

  Column newMethod(Size size) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
              left: size.width * 0.03,
              top: size.width * 0.02,
              bottom: size.width * 0.02,
              right: size.width * 0.03),
          alignment: Alignment.center,
          width: size.width * 0.9,
          height: size.height * 0.07,
          margin: EdgeInsets.only(
              left: size.width * 0.03,
              bottom: size.width * 0.03,
              right: size.width * 0.03),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(119, 187, 162, 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "VEG",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * 0.05,
                    color: const Color.fromRGBO(60, 121, 98, 1.0)),
              ),
              Checkbox(
                  value: vegischeck,
                  activeColor: const Color.fromRGBO(60, 121, 98, 1.0),
                  onChanged: (newbool) {
                    setState(() {
                      vegischeck = newbool;
                    });
                  })
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(
              left: size.width * 0.03,
              top: size.width * 0.02,
              bottom: size.width * 0.02,
              right: size.width * 0.03),
          alignment: Alignment.center,
          width: size.width * 0.9,
          height: size.height * 0.07,
          margin: EdgeInsets.only(
              left: size.width * 0.03,
              bottom: size.width * 0.03,
              right: size.width * 0.03),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(119, 187, 162, 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Fish",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * 0.05,
                    color: const Color.fromRGBO(60, 121, 98, 1.0)),
              ),
              Checkbox(
                  value: fishischeck,
                  activeColor: const Color.fromRGBO(60, 121, 98, 1.0),
                  onChanged: (newbool) {
                    setState(() {
                      fishischeck = newbool;
                    });
                  })
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(
              left: size.width * 0.03,
              top: size.width * 0.02,
              bottom: size.width * 0.02,
              right: size.width * 0.03),
          alignment: Alignment.center,
          width: size.width * 0.9,
          height: size.height * 0.07,
          margin: EdgeInsets.only(
              left: size.width * 0.03,
              bottom: size.width * 0.03,
              right: size.width * 0.03),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(119, 187, 162, 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Chicken",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * 0.05,
                    color: const Color.fromRGBO(60, 121, 98, 1.0)),
              ),
              Checkbox(
                  value: chickenischeck,
                  activeColor: const Color.fromRGBO(60, 121, 98, 1.0),
                  onChanged: (newbool) {
                    setState(() {
                      chickenischeck = newbool;
                    });
                  })
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(
              left: size.width * 0.03,
              top: size.width * 0.02,
              bottom: size.width * 0.02,
              right: size.width * 0.03),
          alignment: Alignment.center,
          width: size.width * 0.9,
          height: size.height * 0.07,
          margin: EdgeInsets.only(
              left: size.width * 0.03,
              bottom: size.width * 0.03,
              right: size.width * 0.03),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(119, 187, 162, 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Egg",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * 0.05,
                    color: const Color.fromRGBO(60, 121, 98, 1.0)),
              ),
              Checkbox(
                  value: eggischeck,
                  activeColor: const Color.fromRGBO(60, 121, 98, 1.0),
                  onChanged: (newbool) {
                    setState(() {
                      eggischeck = newbool;
                    });
                  })
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(
              left: size.width * 0.03,
              top: size.width * 0.02,
              bottom: size.width * 0.02,
              right: size.width * 0.03),
          alignment: Alignment.center,
          width: size.width * 0.9,
          height: size.height * 0.07,
          margin: EdgeInsets.only(
              left: size.width * 0.03,
              bottom: size.width * 0.03,
              right: size.width * 0.03),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(119, 187, 162, 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Rice",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * 0.05,
                    color: const Color.fromRGBO(60, 121, 98, 1.0)),
              ),
              Checkbox(
                  value: riceischeck,
                  activeColor: const Color.fromRGBO(60, 121, 98, 1.0),
                  onChanged: (newbool) {
                    setState(() {
                      riceischeck = newbool;
                    });
                  })
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(
              left: size.width * 0.03,
              top: size.width * 0.02,
              bottom: size.width * 0.02,
              right: size.width * 0.03),
          alignment: Alignment.center,
          width: size.width * 0.9,
          height: size.height * 0.07,
          margin: EdgeInsets.only(
              left: size.width * 0.03,
              bottom: size.width * 0.03,
              right: size.width * 0.03),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(119, 187, 162, 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Kottu",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * 0.05,
                    color: const Color.fromRGBO(60, 121, 98, 1.0)),
              ),
              Checkbox(
                  value: kottuischeck,
                  activeColor: const Color.fromRGBO(60, 121, 98, 1.0),
                  onChanged: (newbool) {
                    setState(() {
                      kottuischeck = newbool;
                    });
                  })
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Rounded corners
              ),
              backgroundColor: const Color.fromRGBO(60, 121, 98, 1.0),
              padding: EdgeInsets.symmetric(
                  horizontal: size.height * 0.04, vertical: 12)),
          child: Text(
            "Update Foods",
            style: TextStyle(
              color: Colors.white,
              fontSize: size.width * 0.04,
            ),
          ),
        ),
      ],
    );
  }
}
