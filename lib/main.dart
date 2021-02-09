import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import "package:latlong/latlong.dart" as latLng;
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './restapi.dart';
import 'mapasseenbycustomer.dart';
import 'mapasseenbyvendor.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then((prefs) {
    runApp(MyApp(prefs: prefs));
  });
}

class MyApp extends StatelessWidget {
  MyApp({this.prefs});
  final prefs;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: _decideMainPage(prefs),
    );
  }
}

Widget _decideMainPage(dynamic prefs) {
  if (prefs.getString('userid') == null) {
    return CustomerMap(id: null);
  } else {
    return VendorMap(id: null);
  }
}
