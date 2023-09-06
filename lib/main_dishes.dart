import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:warachow/meal_information.dart';
import 'package:warachow/profile.dart';
import 'package:warachow/shopping_cart.dart';

import 'adapters/information.dart';
import 'adapters/meals_list.dart';
import 'mainPage.dart';

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

  List<Meals_list> meals = [
    Meals_list(meal_label: "Fried Rice", price: 5, image: "assets/11.png"),
    Meals_list(meal_label: "Jollof Rice", price: 6, image: "assets/12.png"),
    Meals_list(meal_label: "Pasta Rigatoni", price: 4, image: "assets/13.png"),
    Meals_list(meal_label: "Pizza Peperoni", price: 8, image: "assets/14.png"),
    Meals_list(meal_label: "Amala", price: 10, image: "assets/15.png"),
    Meals_list(meal_label: "Butterfly Pasta", price: 8, image: "assets/16.png")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF785B),
        actions: [Icon(Icons.shopping_cart), SizedBox(width: 10)],
        elevation: 0,
      ),
      drawer: NavigationDrawer1(box: box),
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
                                width: 110,
                                height: 50,
                                child: MaterialButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                              builder: (_) => Meal_information(
                                                  meal_index: index)));
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
        height:  MediaQuery.of(context).size.height * 0.09,
        child: Column(
          children: [
            Divider(
                thickness: 0.4,
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
                IconButton(
                  icon: Icon(Icons.shopping_cart, color: Colors.grey),
                  onPressed: () {
                    Navigator.push(context,CupertinoPageRoute(builder: (_)=> Shopping_Cart()));
                  },
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
