import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warachow/sign_up.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white, Color(0xFFd6ccc2), Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.08),
            Image.asset("assets/logomock.png"),
            SizedBox(height: MediaQuery.of(context).size.height * 0.4),
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Welcome to WaraChow",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 23,
                          color: Colors.white,
                          fontFamily: "EBG")),
                  Text(
                      "Order the best meals in Lagos and have \nthem delivered to your doorstep in little \nor no time.Doesn't that sound delicious",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontFamily: "EBG")),
                  ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(40),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(context, CupertinoPageRoute(builder: (_) => Sign_Up()));
                        },
                        color: Colors.white,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: MediaQuery.of(context).size.height * 0.08,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Next",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.grey)),
                            ],
                          ),
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
