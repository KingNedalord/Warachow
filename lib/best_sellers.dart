import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warachow/profile.dart';

class Best_Sellers extends StatefulWidget {
  const Best_Sellers({super.key});

  @override
  State<Best_Sellers> createState() => _Best_SellersState();
}

class _Best_SellersState extends State<Best_Sellers> {
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
            expandedHeight: 180,
            backgroundColor: Color(0xFFFF785B),
            leading: Text(""),
            flexibleSpace: Column(
              children: [
                Text(
                  "Best Sellers",
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
                    "Everyone's favourite dishes and\n                       "
                    "takeouts.",
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
            ),
          ),
          SliverGrid.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: 6,
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20), // Image border
                      child: SizedBox.fromSize(
                          size: Size.fromRadius(48), // Image radius
                          child: Image.asset(index == 0
                              ? "assets/21.png"
                              : index == 1
                                  ? "assets/22.png"
                                  : index == 2
                                      ? "assets/24.png"
                                      : index == 3
                                          ? "assets/14.png"
                                          : index == 4
                                              ? "assets/15.png"
                                              : "assets/26.png")),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              index == 0
                                  ? "Beef Burger"
                                  : index == 1
                                      ? "Shawarma"
                                      : index == 2
                                          ? "Pizza Peperoni"
                                          : index == 3
                                              ? "Cheesy Bread"
                                              : index == 4
                                                  ? "Amala"
                                                  : "Jollof Spaghetti",
                              style: TextStyle(fontSize: 20),
                            ),
                            Container(
                                width: 90,
                                height: 40,
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
        child: Row(
          children: [
            SizedBox(width: MediaQuery.of(context).size.width * 0.27),
            IconButton(
                icon: Icon(Icons.person),
                color: Colors.grey,
                onPressed: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (_) => Profile()));
                }),
            SizedBox(width: MediaQuery.of(context).size.width * 0.1),
            Icon(Icons.home, color: Colors.grey),
            SizedBox(width: MediaQuery.of(context).size.width * 0.1),
            Icon(Icons.shopping_cart, color: Colors.grey),
            SizedBox(width: MediaQuery.of(context).size.width * 0.23),
          ],
        ),
      ),
    );
  }
}
