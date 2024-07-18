import 'package:flutter/material.dart';

class user_card extends StatefulWidget {
  final String mobile_number;
  final String name;
  final String faculty;
  final String address;
  const user_card(
      {super.key,
      required this.address,
      required this.faculty,
      required this.mobile_number,
      required this.name});

  @override
  State<user_card> createState() => _user_cardState();
}

class _user_cardState extends State<user_card> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(
          left: size.width * 0.03,
          top: size.width * 0.02,
          bottom: size.width * 0.02,
          right: size.width * 0.03),
      margin: EdgeInsets.only(
          left: size.width * 0.03,
          bottom: size.width * 0.03,
          right: size.width * 0.03),
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(119, 187, 162, 1.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(width: size.width * 0.14),
          Column(children: [
            Text(
              widget.name,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: size.width * 0.05,
                  color: const Color.fromRGBO(60, 121, 98, 1.0)),
            ),
          ]),
          SizedBox(width: size.width * 0.05),
          Row(children: <Widget>[]),
        ],
      ),
    );
  }
}
