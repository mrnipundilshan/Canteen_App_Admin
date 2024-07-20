import 'dart:convert';
import 'package:canteen/backgrounds/signup_bg.dart';
import 'package:canteen/config/config.dart';
import 'package:canteen/userorder/orderpage.dart';
import 'package:canteen/users/allusers.dart';
import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:http/http.dart' as http;

class userprofile extends StatefulWidget {
  final String mobile_number;
  final String address;
  final String name;
  final String faculty;

  const userprofile(
      {super.key,
      required this.mobile_number,
      required this.address,
      required this.name,
      required this.faculty});

  @override
  State<userprofile> createState() => _userprofileState();
}

class _userprofileState extends State<userprofile> {
  void removeuser() async {
    var reqbody = {
      "mobile_number": widget.mobile_number,
    };
    var response = await http.delete(Uri.parse(removeuserr),
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.06,
            ),
            Container(
              width: size.width * 0.8,
              height: size.height * 0.25,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(119, 187, 162, 1.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    widget.mobile_number,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * 0.05,
                        color: const Color.fromRGBO(60, 121, 98, 1.0)),
                  ),
                  Text(
                    widget.name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * 0.05,
                        color: const Color.fromRGBO(60, 121, 98, 1.0)),
                  ),
                  Text(
                    widget.faculty,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * 0.05,
                        color: const Color.fromRGBO(60, 121, 98, 1.0)),
                  ),
                  Text(
                    widget.address,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * 0.05,
                        color: const Color.fromRGBO(60, 121, 98, 1.0)),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: size.width * 0.03, right: size.width * 0.03),
                        width: size.width * 0.3,
                        height: size.height * 0.07,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 24, 117, 83),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Stack(alignment: Alignment.center, children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: size.width * 0.07,
                                top: size.width * 0.03,
                                bottom: size.width * 0.03,
                                right: size.width * 0.07),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Orders",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.width * 0.05,
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
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
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => orderpage(
                                                  mobilenumber:
                                                      widget.mobile_number,
                                                )));
                                  }),
                            ),
                          ),
                        ]),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: size.width * 0.03, right: size.width * 0.03),
                        width: size.width * 0.3,
                        height: size.height * 0.07,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 24, 117, 83),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Stack(alignment: Alignment.center, children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: size.width * 0.05,
                                top: size.width * 0.03,
                                bottom: size.width * 0.03,
                                right: size.width * 0.05),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Remove",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.width * 0.05,
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
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
                                              entryAnimation:
                                                  EntryAnimation.bottom,
                                              Lottie.asset(
                                                "assets/remove.json",
                                                height: 150,
                                                fit: BoxFit.fitHeight,
                                              ),
                                              title: Text(
                                                'Remove User',
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
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(context,
                                                              'CANCEL'),
                                                      child: Text(
                                                        'CANCEL',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize:
                                                                size.width *
                                                                    0.035,
                                                            color: const Color
                                                                .fromRGBO(60,
                                                                121, 98, 1.0)),
                                                      ),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        removeuser();
                                                        Navigator.pop(
                                                            context, 'OK');
                                                      },
                                                      child: Text('OK',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize:
                                                                  size.width *
                                                                      0.035,
                                                              color: const Color
                                                                  .fromRGBO(
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
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
