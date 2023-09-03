import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:warachow/welcome.dart';
import 'information.dart';
import 'mainPage.dart';


late Box box;
void main() async {
  bool? text;
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  text = await pref.getBool('txt');

  await Hive.initFlutter;
  Hive.registerAdapter<Information>(InformationAdapter());
  box = await Hive.openBox<Information>("info");
  runApp(MaterialApp(
    home: text == true ? Main_Page() : Welcome(),
    debugShowCheckedModeBanner: false,
  ));
}
