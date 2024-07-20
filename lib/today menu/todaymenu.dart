import 'dart:convert';
import 'package:canteen/backgrounds/signup_bg.dart';
import 'package:canteen/config/config.dart';
import 'package:canteen/users/usercard.dart';
import 'package:canteen/users/userclass.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class allusers extends StatefulWidget {
  allusers({super.key});

  @override
  State<allusers> createState() => _allusersState();
}

class _allusersState extends State<allusers> {
  Future<List<User>> users = getallusers();

  static Future<List<User>> getallusers() async {
    final response = await http.get(Uri.parse(getusers));
    final body = json.decode(response.body);
    return body.map<User>(User.fromJson).toList();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getallusers();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Background(
          child: Container(
        child: Column(children: [
          SizedBox(
            height: size.height * 0.08,
          ),
          Container(
            child: Expanded(
                child: FutureBuilder<List<User>>(
                    future: users,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator.adaptive();
                      } else if (snapshot.hasData) {
                        final users = snapshot.data!;
                        return buildusers(users);
                      } else {
                        return const Text("No Menu data");
                      }
                    })),
          )
        ]),
      )),
    );
  }
}

Widget buildusers(List<User> users) {
  return ListView.builder(
    padding: EdgeInsets.zero,
    shrinkWrap: true,
    itemCount: users.length,
    itemBuilder: (context, index) {
      final User = users[index];

      return user_card(
          name: User.name,
          mobile_number: User.mobile_number,
          faculty: User.faculty,
          address: User.address);
    },
  );
}
