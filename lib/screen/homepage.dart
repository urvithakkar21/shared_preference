import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preference/screen/login_screen/login_screen.dart';
import 'package:shared_preference/services/pref_services.dart';
import 'package:shared_preference/utils/pref_res.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List userList = [];

  @override
  void initState() {
    // TODO: implement initState
    getUserList();
    super.initState();
  }

  void getUserList() {
    String userListString = PrefServices.getString(PrefRes.userList);
    userList.clear();
    userList = jsonDecode(userListString);
    print(userList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        actions: [
          IconButton(
              onPressed: () {
                PrefServices.clearPref;
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => Login_Screen(),
                    ),
                    (route) => false);
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(userList[index]["email"]),
        ),
      ),
    );
  }
}
