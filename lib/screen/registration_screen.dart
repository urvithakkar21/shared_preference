import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preference/services/pref_services.dart';
import 'package:shared_preference/utils/pref_res.dart';

class Register_Screen extends StatefulWidget {
  const Register_Screen({super.key});

  @override
  State<Register_Screen> createState() => _Register_ScreenState();
}

class _Register_ScreenState extends State<Register_Screen> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  void onTapRegister(BuildContext context){
    Map<String, dynamic> user = {};
    List userList = [];
    user = {
      "email": email.text.trim(),
      "pass":pass.text.trim()
    };

    String userListString = PrefServices.getString(PrefRes.userList);
    if (userListString.isNotEmpty) {
     userList = jsonDecode(userListString) ;
      print(userList);
      bool isLogin = userList.any(
            (element) =>
        element["email"] == email.text.trim()
      );
      if (isLogin) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("User is already register"),
          ),
        );
      } else {
        userList.add(user);
      }
    } else {
      userList.add(user);
    }
     print(userList);
    userListString  = jsonEncode(userList);
    print("================>  $userListString");
    PrefServices.setValue(PrefRes.userList, userListString);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register"),),
      body: Column(
        children: [
          TextField(
            controller: email,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(20),
              hintText: "Email",
            ),
          ),
          TextField(
            controller: pass,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(20),
              hintText: "Password",
            ),
          ),
          ElevatedButton(
            onPressed: () => onTapRegister(context),
            child: const Text(
              "Register",
            ),
          ),
        ],
      )
    );
  }
}
