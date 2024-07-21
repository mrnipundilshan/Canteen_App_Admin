import 'package:canteen/backgrounds/signup_bg.dart';
import 'package:canteen/deliver/delivers.dart';
import 'package:canteen/orders/orders.dart';
import 'package:canteen/today%20menu/todaymenu.dart';
import 'package:canteen/users/allusers.dart';
import 'package:flutter/material.dart';

class toolspage extends StatefulWidget {
  const toolspage({super.key});

  @override
  State<toolspage> createState() => _toolspageState();
}

class _toolspageState extends State<toolspage> {
  String imagename = '';
  String gridname = '';

  void _navigateToUsers() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => allusers()),
    );
  }

  void _navigateToTodayMenu() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => todaymenu()),
    );
  }

  void _navigateToorders() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const allorderpage()),
    );
  }

  void _navigateTodeliver() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const deliverpage()),
    );
  }

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
              grid(
                size: size,
                imagename: "assets/menuicons/users.png",
                gridname: "Users",
                onTap: _navigateToUsers,
              ),
              grid(
                size: size,
                imagename: "assets/menuicons/menu.png",
                gridname: "Today menu",
                onTap: _navigateToTodayMenu,
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              grid(
                size: size,
                imagename: "assets/menuicons/orders.png",
                gridname: "Orders",
                onTap: _navigateToorders,
              ),
              grid(
                size: size,
                imagename: "assets/menuicons/deliver.png",
                gridname: "Deliver",
                onTap: _navigateTodeliver,
              ),
            ],
          )
        ]),
      )),
    );
  }
}

class grid extends StatelessWidget {
  const grid({
    super.key,
    required this.size,
    required this.imagename,
    required this.gridname,
    required this.onTap,
  });

  final Size size;
  final String imagename;
  final String gridname;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        alignment: Alignment.center,
        width: size.width * 0.4,
        height: size.height * 0.15,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(119, 187, 162, 1.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagename.toLowerCase(),
              width: size.width * 0.25,
            ),
            Text(
              gridname.toLowerCase(),
              style: TextStyle(
                  fontSize: size.width * 0.05,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromRGBO(60, 121, 98, 1.0)),
            )
          ],
        ),
      ),
      Positioned.fill(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            splashColor: Colors.black12,
            onTap: onTap,
          ),
        ),
      ),
    ]);
  }
}
