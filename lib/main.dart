import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:warachow/welcome.dart';

import 'mainPage.dart';


void main() async{
  bool? text;
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  text = await pref.getBool('txt');
  runApp(MaterialApp(
    home: text == true?Main_Page():Welcome(),
    debugShowCheckedModeBanner: false,
  ));
}
