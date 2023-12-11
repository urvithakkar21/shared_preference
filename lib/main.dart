import 'package:flutter/material.dart';
import 'package:shared_preference/services/pref_services.dart';

import 'screen/login_screen/login_screen.dart';
import 'screen/registration_screen.dart';
import 'screen/splesh_screen/splesh_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  PrefServices.initPref();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Splesh_Screen(),
  ));
}
