import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preference/screen/homepage.dart';
import 'package:shared_preference/screen/registration_screen.dart';
import 'package:shared_preference/services/pref_services.dart';
import 'package:shared_preference/utils/pref_res.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future<void> onTapLogin(BuildContext context) async {
    String userListString = PrefServices.getString(PrefRes.userList);
    if (userListString.isNotEmpty) {
      List userList = jsonDecode(userListString);
      print(userList);
      bool isLogin = userList.any(
        (element) =>
            element["email"] == email.text.trim() &&
            element["pass"] == pass.text.trim(),
      );
      if (isLogin) {
        PrefServices.setValue(PrefRes.isLogin, isLogin);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("User id Not Found"),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("No User Please SignUp"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Column(
        children: [
          TextField(
            controller: email,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(8),
              hintText: "email",
            ),
          ),
          TextField(
            controller: pass,
            decoration: const InputDecoration(
              errorStyle: TextStyle(),
              errorText: 'Please enter something',
              contentPadding: EdgeInsets.all(8),
              hintText: "password",
            ),
          ),
          ElevatedButton(
            onPressed: () => onTapLogin(context),
            child: const Text(
              "Login",
            ),
          ),
          InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Register_Screen(),
                  ),
                );
              },
              child: const Text("Creat new Account for SignUp"))
        ],
      ),
    );
  }
}
