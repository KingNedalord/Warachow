import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:warachow/welcome/welcome.dart';

import '../adapters/information.dart';
import '../adapters/meals_list.dart';
import '../adapters/wishlist_adapter.dart';
import '../firebase_options.dart';
import '../mainPage.dart';


late Box box;
late Box meals_box;
late Box wish_box;

void main() async {
  bool? text;
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  text = await pref.getBool('txt');

  await Hive.initFlutter();
  Hive.registerAdapter<Information>(InformationAdapter());
  box = await Hive.openBox<Information>("info");

  await Hive.initFlutter();
  Hive.registerAdapter<Meals_list>(MealslistAdapter());
  meals_box = await Hive.openBox<Meals_list>("meal");

  await Hive.initFlutter();
  Hive.registerAdapter<Wishlist>(WishlistAdapter());
  wish_box = await Hive.openBox<Wishlist>("wishlist");

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    home:
    text == true ? Main_Page() : Welcome(),
    debugShowCheckedModeBanner: false,
  ));
}
