import 'dart:convert';
import 'package:canteen/admintools.dart';
import 'package:canteen/backgrounds/signup_bg.dart';
import 'package:canteen/config/config.dart';
import 'package:canteen/deliver/deliverscard.dart';
import 'package:canteen/deliver/deliversclass.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class deliverpage extends StatefulWidget {
  const deliverpage({super.key});

  @override
  State<deliverpage> createState() => _deliverpageState();
}

class _deliverpageState extends State<deliverpage> {
  Future<List<deliver>> delivers = getalldelivers();

  static Future<List<deliver>> getalldelivers() async {
    final response = await http.get(Uri.parse(getdelivers));
    final body = json.decode(response.body);
    return body.map<deliver>(deliver.fromJson).toList();
  }

  @override
  void initState() {
    //TODO: implement initState
    super.initState();

    getalldelivers();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Background(
            child: SingleChildScrollView(
                child: Container(
                    width: double.infinity,
                    height: size.height,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Stack(
                            children: <Widget>[
                              Padding(
                                padding:
                                    EdgeInsets.only(left: size.width * 0.045),
                                child: Image(
                                  image: AssetImage("assets/back.png"),
                                  width: size.width * 0.12,
                                ),
                              ),
                              Positioned.fill(
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(50),
                                    splashColor: Colors.black12,
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  toolspage()));
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Expanded(
                            child: FutureBuilder<List<deliver>>(
                                future: delivers,
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const CircularProgressIndicator
                                        .adaptive();
                                  } else if (snapshot.hasData) {
                                    final delivers = snapshot.data!;

                                    return buildorders(delivers);
                                  } else {
                                    return const Text("No Menu data");
                                  }
                                })),
                      ],
                    )))));
  }
}

Widget buildorders(List<deliver> delivers) {
  return ListView.builder(
    padding: EdgeInsets.zero,
    shrinkWrap: true,
    itemCount: delivers.length,
    itemBuilder: (context, index) {
      final Order = delivers[index];

      return deliver_card(
          mobile_number: Order.mobile_number,
          total: Order.total,
          veg_count: Order.veg_count,
          veg_price: Order.veg_price,
          egg_count: Order.egg_count,
          egg_price: Order.egg_price,
          chicken_count: Order.chicken_count,
          chicken_price: Order.chicken_price,
          rice_count: Order.rice_count,
          rice_price: Order.rice_price,
          kottu_count: Order.kottu_count,
          kottu_price: Order.kottu_price,
          fish_count: Order.fish_count,
          fish_price: Order.fish_price,
          orderid: Order.orderid);
    },
  );
}
