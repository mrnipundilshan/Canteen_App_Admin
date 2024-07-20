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
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  static Future<List<User>> getallusers() async {
    final response = await http.get(Uri.parse(getusers));
    final body = json.decode(response.body);
    return body.map<User>(User.fromJson).toList();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text;
      });
    });
    getallusers();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
          child: Container(
        child: Column(children: [
          SizedBox(
            height: size.height * 0.08,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search by mobile number',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(
                      color: Color.fromRGBO(
                          60, 121, 98, 1.0) // Change to your desired color
                      ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  child: FutureBuilder<List<User>>(
                      future: users,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator.adaptive();
                        } else if (snapshot.hasData) {
                          final users = snapshot.data!
                              .where((user) =>
                                  user.mobile_number.startsWith(_searchQuery))
                              .toList();

                          return buildusers(users);
                        } else {
                          return const Text("No Menu data");
                        }
                      })),
            ],
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
