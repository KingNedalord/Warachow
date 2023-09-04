import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:warachow/profile.dart';

import 'information.dart';

class Main_Dishes extends StatefulWidget {
  const Main_Dishes({super.key});

  @override
  State<Main_Dishes> createState() => _Main_DishesState();
}

class _Main_DishesState extends State<Main_Dishes> {
  late Box<Information> box;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    box = Hive.box("info");
  }

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
                SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                Text(box.getAt(0)!.name,
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w500))
              ],
            ),
            Row(
              children: [
                Container(
                    width: 50,
                    height: 50,
                    child: Image.asset("assets/profile.png")),
                Text("Profile",
                    style: TextStyle(fontSize: 23, color: Colors.white))
              ],
            ),
            Row(
              children: [
                Container(
                    width: 50,
                    height: 50,
                    child: Image.asset("assets/heart.png")),
                Text("Wishlist",
                    style: TextStyle(fontSize: 23, color: Colors.white))
              ],
            ),
            Row(
              children: [
                Container(
                    width: 50,
                    height: 50,
                    child: Image.asset("assets/medal.png")),
                Text("Loyalty Points",
                    style: TextStyle(fontSize: 23, color: Colors.white))
              ],
            ),
            Row(
              children: [
                Container(
                    width: 50,
                    height: 50,
                    child: Image.asset("assets/cart.png")),
                Text("Payment Methods",
                    style: TextStyle(fontSize: 23, color: Colors.white))
              ],
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: MediaQuery.of(context).size.height * 0.25,
            backgroundColor: Color(0xFFFF785B),
            leading: Text(""),
            pinned: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12))),
            flexibleSpace: Column(
              children: [
                Text(
                  "Main Dishes",
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
                    "Find the best selling dishes. All\n"
                    "meals are prepared fresh",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontFamily: "EBG", fontSize: 17)),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.009,
                ),
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
              // ),
            ),
          ),
          SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: 6,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(left: index % 2 == 0 ? 12:0,right: index % 2 == 0 ? 0:12,),
                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[400]!,width: 4))),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20), // Image border
                      child: SizedBox.fromSize(
                          size: Size.fromRadius(48), // Image radius
                          child: Image.asset(index == 0
                              ? "assets/11.png"
                              : index == 1
                                  ? "assets/12.png"
                                  : index == 2
                                      ? "assets/13.png"
                                      : index == 3
                                          ? "assets/14.png"
                                          : index == 4
                                              ? "assets/15.png"
                                              : "assets/16.png")),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              index == 0
                                  ? "Fried Rice"
                                  : index == 1
                                      ? "Jollof Rice"
                                      : index == 2
                                          ? "Pasta Rigatoni"
                                          : index == 3
                                              ? "Pizza Peperoni"
                                              : index == 4
                                                  ? "Amala"
                                                  : "Butterfly Pasta",
                              style: TextStyle(fontSize: 20),
                            ),
                            Container(
                                width: 110,
                                height: 50,
                                child: Image.asset("assets/buy_now.png"))
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 70,
        child: Column(
          children: [
            Divider(thickness: 0.3,color: Colors.grey[400],indent: 15,endIndent: 15),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width * 0.27),
                IconButton(
                    icon: Icon(Icons.person),
                    color: Colors.grey,
                    onPressed: () {
                      Navigator.push(
                          context, CupertinoPageRoute(builder: (_) => Profile()));
                    }),
                SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                IconButton(
                  icon: Icon(Icons.home, color: Colors.grey),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                Icon(Icons.shopping_cart, color: Colors.grey),
                SizedBox(width: MediaQuery.of(context).size.width * 0.23),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
