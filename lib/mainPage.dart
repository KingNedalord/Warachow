import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warachow/best_sellers.dart';

import 'main_dishes.dart';

class Main_Page extends StatefulWidget {
  const Main_Page({super.key});

  @override
  State<Main_Page> createState() => _Main_PageState();
}

class _Main_PageState extends State<Main_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF785B),
        actions: [Icon(Icons.shopping_cart), SizedBox(width: 10)],
        elevation: 0,
      ),
      drawer: Drawer(
        backgroundColor: Color(0xFFFF785B),
        elevation: 20,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                    width: 50,
                    height: 50,
                    child: Image.asset("assets/profile.png")),
                Text("Profile",
                    style: TextStyle(fontSize: 25, color: Colors.white))
              ],
            ),
            Row(
              children: [
                Container(
                    width: 50,
                    height: 50,
                    child: Image.asset("assets/heart.png")),
                Text("Wishlist",
                    style: TextStyle(fontSize: 25, color: Colors.white))
              ],
            ),
            Row(
              children: [
                Container(
                    width: 50,
                    height: 50,
                    child: Image.asset("assets/medal.png")),
                Text("Loyalty Points",
                    style: TextStyle(fontSize: 25, color: Colors.white))
              ],
            ),
            Row(
              children: [
                Container(
                    width: 50,
                    height: 50,
                    child: Image.asset("assets/cart.png")),
                Text("Payment Methods",
                    style: TextStyle(fontSize: 25, color: Colors.white))
              ],
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              expandedHeight: 220,
              backgroundColor: Color(0xFFFF785B),
              leading: Text(""),
              flexibleSpace: Column(
                children: [
                  Text(
                    "Welcome",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "EBG",
                        fontWeight: FontWeight.w500,
                        fontSize: 40),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text(
                      "Homemade meals prepared with\n     "
                      "love.  Richest  ingredients",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "EBG",
                          fontSize: 20)),
                  SizedBox(height: 5),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Search Menu",
                          prefixIcon: Icon(Icons.search_outlined),
                          border: OutlineInputBorder(
                              gapPadding: 20,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
                    ),
                  ),
                ],
              )),
          SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
            return Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (_) =>
                                index == 0 ? Main_Dishes() : Best_Sellers()));
                  },
                  child: Container(
                    child: Column(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            child: Image.asset(
                                index == 0 ? "assets/1.png" : "assets/2.png")),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              index == 0
                                  ? "    Main Dishes"
                                  : "    Best Sellers",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w700),
                            ),
                            Icon(Icons.arrow_forward_ios_rounded)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          }, childCount: 2))
        ],
      ),
    );
  }
}
