import 'dart:convert';
import 'package:canteen/backgrounds/signup_bg.dart';
import 'package:canteen/config/config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class overview extends StatefulWidget {
  overview({super.key});

  @override
  State<overview> createState() => _overviewState();
}

class _overviewState extends State<overview> {
  int oveg_count = 0;
  int oveg_price = 0;
  int oegg_count = 0;
  int oegg_price = 0;
  int ochicken_count = 0;
  int ochicken_price = 0;
  int orice_count = 0;
  int orice_price = 0;
  int okottu_count = 0;
  int okottu_price = 0;
  int ofish_count = 0;
  int ofish_price = 0;

  int dveg_count = 0;
  int dveg_price = 0;
  int degg_count = 0;
  int degg_price = 0;
  int dchicken_count = 0;
  int dchicken_price = 0;
  int drice_count = 0;
  int drice_price = 0;
  int dkottu_count = 0;
  int dkottu_price = 0;
  int dfish_count = 0;
  int dfish_price = 0;

  int users = 0;

  @override
  void initState() {
    super.initState();
    updatelist();
    updatedeliverlist();
    getUserCounts();
  }

  void getUserCounts() async {
    var response = await http.get(Uri.parse(getUserCount));

    var json = jsonDecode(response.body);
    print(json);

    if (json['status']) {
      setState(() {
        users = json['userCount'];
      });
    } else {
      print("not susces");
    }
  }

  void updatelist() async {
    var response = await http.get(Uri.parse(getoverview));

    var json = jsonDecode(response.body);

    if (json['status']) {
      setState(() {
        oveg_count = json['totalVegCount'];
        oveg_price = json['vegPrice'];
        oegg_count = json['totalEggCount'];
        oegg_price = json['eggPrice'];
        ochicken_count = json['totalChickenCount'];
        ochicken_price = json['chickenPrice'];
        orice_count = json['totalRiceCount'];
        orice_price = json['ricePrice'];
        okottu_count = json['totalKottuCount'];
        okottu_price = json['kottuPrice'];
        ofish_count = json['totalFishCount'];
        ofish_price = json['fishPrice'];
      });
    } else {
      print("not susces");
    }
  }

  void updatedeliverlist() async {
    var response = await http.get(Uri.parse(getdeliveroverview));

    var json = jsonDecode(response.body);

    if (json['status']) {
      setState(() {
        dveg_count = json['totalVegCount'];
        dveg_price = json['vegPrice'];
        degg_count = json['totalEggCount'];
        degg_price = json['eggPrice'];
        dchicken_count = json['totalChickenCount'];
        dchicken_price = json['chickenPrice'];
        drice_count = json['totalRiceCount'];
        drice_price = json['ricePrice'];
        dkottu_count = json['totalKottuCount'];
        dkottu_price = json['kottuPrice'];
        dfish_count = json['totalFishCount'];
        dfish_price = json['fishPrice'];
      });
    } else {
      print("not susces");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Background(
            child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: size.height * 0.08,
            ),
            newMethod(size),
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
                    "Total",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * 0.05,
                        color: const Color.fromRGBO(60, 121, 98, 1.0)),
                  ),
                  Text(
                    (((dveg_count + oveg_count) * oveg_price) +
                            ((oegg_count + degg_count) * oegg_price) +
                            ((ofish_count + dfish_count) * ofish_price) +
                            ((ochicken_count + dchicken_count) *
                                ochicken_price) +
                            ((orice_count + drice_count) * orice_price) +
                            ((okottu_count + dkottu_count) * okottu_price))
                        .toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * 0.05,
                        color: const Color.fromRGBO(60, 121, 98, 1.0)),
                  ),
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
                    "Total Users",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * 0.05,
                        color: const Color.fromRGBO(60, 121, 98, 1.0)),
                  ),
                  Text(
                    users.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * 0.05,
                        color: const Color.fromRGBO(60, 121, 98, 1.0)),
                  ),
                ],
              ),
            ),
          ]),
        )),
      ),
    );
  }

  Column newMethod(Size size) {
    return Column(
      children: <Widget>[
        summery(
            name: "Veg",
            oveg_count: oveg_count,
            dveg_count: dveg_count,
            oveg_price: oveg_price),
        summery(
            name: "Egg",
            oveg_count: oegg_count,
            dveg_count: degg_count,
            oveg_price: oegg_price),
        summery(
            name: "Chicken",
            oveg_count: ochicken_count,
            dveg_count: dchicken_count,
            oveg_price: ochicken_price),
        summery(
            name: "Fish",
            oveg_count: ofish_count,
            dveg_count: dfish_count,
            oveg_price: ofish_price),
        summery(
            name: "Rice",
            oveg_count: orice_count,
            dveg_count: drice_count,
            oveg_price: orice_price),
        summery(
            name: "Kottu",
            oveg_count: okottu_count,
            dveg_count: dkottu_count,
            oveg_price: okottu_price)
      ],
    );
  }
}

class summery extends StatelessWidget {
  const summery({
    super.key,
    required this.name,
    required this.oveg_count,
    required this.dveg_count,
    required this.oveg_price,
  });
  final String name;
  final int oveg_count;
  final int dveg_count;
  final int oveg_price;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(
          left: size.width * 0.03,
          top: size.width * 0.02,
          bottom: size.width * 0.02,
          right: size.width * 0.03),
      alignment: Alignment.center,
      width: size.width * 0.9,
      height: size.height * 0.16,
      margin: EdgeInsets.only(
          left: size.width * 0.03,
          bottom: size.width * 0.03,
          right: size.width * 0.03),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(119, 187, 162, 1.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Text(
            name,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: size.width * 0.04,
                color: const Color.fromRGBO(60, 121, 98, 1.0)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Order",
                  style: TextStyle(
                      fontSize: size.width * 0.04,
                      color: const Color.fromRGBO(60, 121, 98, 1.0))),
              Text(oveg_count.toString(),
                  style: TextStyle(
                      fontSize: size.width * 0.04,
                      color: const Color.fromRGBO(60, 121, 98, 1.0)))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Deliver",
                  style: TextStyle(
                      fontSize: size.width * 0.04,
                      color: const Color.fromRGBO(60, 121, 98, 1.0))),
              Text(dveg_count.toString(),
                  style: TextStyle(
                      fontSize: size.width * 0.04,
                      color: const Color.fromRGBO(60, 121, 98, 1.0)))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name + " Total",
                  style: TextStyle(
                      fontSize: size.width * 0.04,
                      color: const Color.fromRGBO(60, 121, 98, 1.0))),
              Text((dveg_count + oveg_count).toString(),
                  style: TextStyle(
                      fontSize: size.width * 0.04,
                      color: const Color.fromRGBO(60, 121, 98, 1.0)))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total Rs",
                  style: TextStyle(
                      fontSize: size.width * 0.04,
                      color: const Color.fromRGBO(60, 121, 98, 1.0))),
              Text(((dveg_count + oveg_count) * oveg_price).toString(),
                  style: TextStyle(
                      fontSize: size.width * 0.04,
                      color: const Color.fromRGBO(60, 121, 98, 1.0)))
            ],
          )
        ],
      ),
    );
  }
}
