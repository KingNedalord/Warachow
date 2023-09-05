import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:warachow/meal_information2.dart';
import 'package:warachow/profile.dart';

import 'adapters/information.dart';
import 'loyalty_points.dart';
import 'adapters/meals_list.dart';

class Best_Sellers extends StatefulWidget {
  const Best_Sellers({super.key});

  @override
  State<Best_Sellers> createState() => _Best_SellersState();
}

class _Best_SellersState extends State<Best_Sellers> {
  late Box<Information> box;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    box = Hive.box("info");
  }

  List<Meals_list> meals = [
    Meals_list(meal_label: "Beef Burger", price: 5, image: "assets/21.png"),
    Meals_list(meal_label: "Shawarma", price: 6, image: "assets/22.png"),
    Meals_list(meal_label: "Pizza Peperoni", price: 8, image: "assets/24.png"),
    Meals_list(meal_label: "Cheesy Bread", price: 3, image: "assets/14.png"),
    Meals_list(meal_label: "Amala", price: 10, image: "assets/15.png"),
    Meals_list(meal_label: "Jollof Spaghetti", price: 5, image: "assets/26.png")
  ];

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
                TextButton(
                    child: Text("Profile",
                        style: TextStyle(fontSize: 25, color: Colors.white)),
                    onPressed: () {
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (_) => Profile()));
                    })
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
                TextButton(
                    child: Text("Loyalty Points",
                        style: TextStyle(fontSize: 25, color: Colors.white)),
                    onPressed: () {
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (_) => Loyalty_Points()));
                    })
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
            toolbarHeight: MediaQuery.of(context).size.height * 0.25,
            backgroundColor: Color(0xFFFF785B),
            leading: Text(""),
            pinned: true,
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
                    "Everyone's favourite dishes and\n"
                    "takeouts.",
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
            ),
          ),
          SliverGrid.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: meals.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(
                  left: index % 2 == 0 ? 12 : 0,
                  right: index % 2 == 0 ? 0 : 12,
                ),
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Colors.grey[400]!, width: 4))),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20), // Image border
                      child: SizedBox.fromSize(
                          size: Size.fromRadius(48), // Image radius
                          child: Image.asset(meals[index].image)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              meals[index].meal_label,
                              style: TextStyle(fontSize: 20),
                            ),
                            Container(
                                width: 90,
                                height: 40,
                                child: MaterialButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                              builder: (_) => Meal_Information2(
                                                  meal_index2: index)));
                                    },
                                    child: Image.asset("assets/buy_now.png")))
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
            Divider(
                thickness: 0.3,
                color: Colors.grey[400],
                indent: 15,
                endIndent: 15),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width * 0.27),
                IconButton(
                    icon: Icon(Icons.person),
                    color: Colors.grey,
                    onPressed: () {
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (_) => Profile()));
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
