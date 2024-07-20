import 'dart:convert';
import 'package:canteen/config/config.dart';
import 'package:canteen/users/allusers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:http/http.dart' as http;

class order_card extends StatefulWidget {
  final int total;
  final int veg_count;
  final int veg_price;
  final int egg_count;
  final int egg_price;
  final int chicken_count;
  final int chicken_price;
  final int rice_count;
  final int rice_price;
  final int kottu_count;
  final int kottu_price;
  final int fish_count;
  final int fish_price;
  final String orderid;

  const order_card(
      {super.key,
      required this.total,
      required this.veg_count,
      required this.veg_price,
      required this.egg_count,
      required this.egg_price,
      required this.chicken_count,
      required this.chicken_price,
      required this.rice_count,
      required this.rice_price,
      required this.kottu_count,
      required this.kottu_price,
      required this.fish_count,
      required this.fish_price,
      required this.orderid});
  @override
  State<order_card> createState() => _order_cardState();
}

class _order_cardState extends State<order_card> {
  void removeorder() async {
    var reqbody = {
      "_id": widget.orderid,
    };
    var response = await http.delete(Uri.parse(removeorderr),
        headers: {"content-Type": "application/json"},
        body: jsonEncode(reqbody));

    var jsonResponse = jsonDecode(response.body);

    if (jsonResponse['status']) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => allusers()));
    } else {
      print("Somthing went wrong");
    }
  }

  @override
  Widget build(BuildContext context) {
    int vegtotal = widget.veg_count * widget.veg_price;
    int eggtotal = widget.egg_count * widget.egg_price;
    int chickentotal = widget.chicken_count * widget.chicken_price;
    int ricetotal = widget.rice_count * widget.rice_price;
    int kottutotal = widget.kottu_count * widget.kottu_price;
    int fishtotal = widget.fish_count * widget.fish_price;
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
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "ID: " + widget.orderid,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * 0.03,
                    color: const Color.fromRGBO(60, 121, 98, 1.0)),
              ),
              IconButton(
                  iconSize: size.width * 0.035,
                  color: const Color.fromARGB(255, 11, 105, 69),
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: widget.orderid));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Your Order ID coppied')),
                    );
                  },
                  icon: const Icon(Icons.copy)),
            ],
          ),
          Table(
            columnWidths: const {
              0: FlexColumnWidth(1),
              1: FlexColumnWidth(1),
              2: FlexColumnWidth(1),
            },
            children: [
              TableRow(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Veg",
                      style: TextStyle(
                          fontSize: size.width * 0.045,
                          color: const Color.fromRGBO(60, 121, 98, 1.0)),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      widget.veg_count.toString(),
                      style: TextStyle(
                          fontSize: size.width * 0.045,
                          color: const Color.fromRGBO(60, 121, 98, 1.0)),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      vegtotal.toString(),
                      style: TextStyle(
                          fontSize: size.width * 0.045,
                          color: const Color.fromRGBO(60, 121, 98, 1.0)),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Egg",
                      style: TextStyle(
                          fontSize: size.width * 0.045,
                          color: const Color.fromRGBO(60, 121, 98, 1.0)),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      widget.egg_count.toString(),
                      style: TextStyle(
                          fontSize: size.width * 0.045,
                          color: const Color.fromRGBO(60, 121, 98, 1.0)),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      eggtotal.toString(),
                      style: TextStyle(
                          fontSize: size.width * 0.045,
                          color: const Color.fromRGBO(60, 121, 98, 1.0)),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Fish",
                      style: TextStyle(
                          fontSize: size.width * 0.045,
                          color: const Color.fromRGBO(60, 121, 98, 1.0)),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      widget.fish_count.toString(),
                      style: TextStyle(
                          fontSize: size.width * 0.045,
                          color: const Color.fromRGBO(60, 121, 98, 1.0)),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      fishtotal.toString(),
                      style: TextStyle(
                          fontSize: size.width * 0.045,
                          color: const Color.fromRGBO(60, 121, 98, 1.0)),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Chicken",
                      style: TextStyle(
                          fontSize: size.width * 0.045,
                          color: const Color.fromRGBO(60, 121, 98, 1.0)),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      widget.chicken_count.toString(),
                      style: TextStyle(
                          fontSize: size.width * 0.045,
                          color: const Color.fromRGBO(60, 121, 98, 1.0)),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      chickentotal.toString(),
                      style: TextStyle(
                          fontSize: size.width * 0.045,
                          color: const Color.fromRGBO(60, 121, 98, 1.0)),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Rice",
                      style: TextStyle(
                          fontSize: size.width * 0.045,
                          color: const Color.fromRGBO(60, 121, 98, 1.0)),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      widget.rice_count.toString(),
                      style: TextStyle(
                          fontSize: size.width * 0.045,
                          color: const Color.fromRGBO(60, 121, 98, 1.0)),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      ricetotal.toString(),
                      style: TextStyle(
                          fontSize: size.width * 0.045,
                          color: const Color.fromRGBO(60, 121, 98, 1.0)),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Kottu",
                      style: TextStyle(
                          fontSize: size.width * 0.045,
                          color: const Color.fromRGBO(60, 121, 98, 1.0)),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      widget.kottu_count.toString(),
                      style: TextStyle(
                          fontSize: size.width * 0.045,
                          color: const Color.fromRGBO(60, 121, 98, 1.0)),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      kottutotal.toString(),
                      style: TextStyle(
                          fontSize: size.width * 0.045,
                          color: const Color.fromRGBO(60, 121, 98, 1.0)),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total: Rs." + widget.total.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * 0.05,
                    color: const Color.fromRGBO(60, 121, 98, 1.0)),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                    left: size.width * 0.03, right: size.width * 0.03),
                width: size.width * 0.2,
                height: size.height * 0.04,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 24, 117, 83),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Stack(alignment: Alignment.center, children: [
                  Padding(
                    padding: EdgeInsets.only(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Remove",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * 0.03,
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ],
                    ),
                  ),
                  Positioned.fill(
                    child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            splashColor: Colors.black12,
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return GiffyDialog.lottie(
                                      backgroundColor: Colors.white,
                                      entryAnimation: EntryAnimation.bottom,
                                      Lottie.asset(
                                        "assets/remove.json",
                                        height: 150,
                                        fit: BoxFit.fitHeight,
                                      ),
                                      title: Text(
                                        'Remove The Order',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: size.width * 0.05,
                                            color: const Color.fromRGBO(
                                                60, 121, 98, 1.0)),
                                      ),
                                      actions: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  context, 'CANCEL'),
                                              child: Text(
                                                'CANCEL',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        size.width * 0.035,
                                                    color: const Color.fromRGBO(
                                                        60, 121, 98, 1.0)),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                removeorder();
                                                Navigator.pop(context, 'OK');
                                              },
                                              child: Text('OK',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize:
                                                          size.width * 0.035,
                                                      color:
                                                          const Color.fromRGBO(
                                                              60,
                                                              121,
                                                              98,
                                                              1.0))),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  });
                            })),
                  ),
                ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
