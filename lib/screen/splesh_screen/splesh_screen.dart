import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preference/screen/homepage.dart';
import 'package:shared_preference/screen/login_screen/login_screen.dart';
import 'package:shared_preference/services/pref_services.dart';
import 'package:shared_preference/utils/pref_res.dart';

class Splesh_Screen extends StatefulWidget {
  const Splesh_Screen({super.key});

  @override
  State<Splesh_Screen> createState() => _Splesh_ScreenState();
}

class _Splesh_ScreenState extends State<Splesh_Screen> {
  @override
  void initState() {
    // TODO: implement initState
    bool isLogin = PrefServices.getBool(PrefRes.isLogin);
    // navigation();
    Timer(
      Duration(seconds: 2),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => isLogin ? HomeScreen() : Login_Screen(),
        ),
      ),
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset('assets/images/Backup_of_tom-17 1.png')),
    );
  }
}
