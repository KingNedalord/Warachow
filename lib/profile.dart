import 'package:flutter/material.dart';

import 'main.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 25),
      ),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Profile",
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Divider(
                color: Colors.grey[400],
                height: 1,
                thickness: 1,
                endIndent: 30,
                indent: 30,
              )
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Transform.rotate(angle: 100,child: Text(box.get("info")!.name,style: TextStyle(color: Colors.black),),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
