import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:warachow/meal_info.dart';
import 'package:warachow/user%20pages/profile.dart';
import 'package:warachow/user%20pages/shopping_cart.dart';

import 'adapters/information.dart';
import 'adapters/meals_list.dart';
import 'mainPage.dart';

class Food_Pages extends StatefulWidget {
  final String meal_page;
  const Food_Pages({super.key,required this.meal_page});

  @override
  State<Food_Pages> createState() => _Food_PagesState();
}

class _Food_PagesState extends State<Food_Pages> {
  late Box<Information> box;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    box = Hive.box("info");
  }
  List<Meals_list> meals1 = [
    Meals_list(
        meal_label: "Fried Rice", price: 5, image: "assets/11.png", amount: 1),
    Meals_list(
        meal_label: "Jollof Rice", price: 6, image: "assets/12.png", amount: 1),
    Meals_list(
        meal_label: "Pasta Rigatoni",
        price: 4,
        image: "assets/13.png",
        amount: 1),
    Meals_list(
        meal_label: "Pizza Peperoni",
        price: 8,
        image: "assets/14.png",
        amount: 1),
    Meals_list(
        meal_label: "Amala", price: 10, image: "assets/15.png", amount: 1),
    Meals_list(
        meal_label: "Butterfly Pasta",
        price: 8,
        image: "assets/16.png",
        amount: 1)
  ];
  List<Meals_list> meals2 = [
    Meals_list(
        meal_label: "Beef Burger", price: 5, image: "assets/21.png", amount: 1),
    Meals_list(
        meal_label: "Shawarma", price: 6, image: "assets/22.png", amount: 1),
    Meals_list(
        meal_label: "Cheesy Bread",
        price: 8,
        image: "assets/24.png",
        amount: 1),
    Meals_list(
        meal_label: "Pizza Peperoni",
        price: 3,
        image: "assets/14.png",
        amount: 1),
    Meals_list(
        meal_label: "Amala", price: 10, image: "assets/15.png", amount: 1),
    Meals_list(
        meal_label: "Jollof Spaghetti",
        price: 5,
        image: "assets/26.png",
        amount: 1)
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
            toolbarHeight: MediaQuery.of(context).size.height * 0.27,
            backgroundColor: Color(0xFFFF785B),
            leading: Text(""),
            pinned: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12))),
            flexibleSpace: Column(
              children: [
                Text(widget.meal_page == "meals1" ?"Main Dishes":
                  "Best Sellers",
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: "EBG",
                      fontWeight: FontWeight.w500,
                      fontSize: 40),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(widget.meal_page == "meals1" ?"Find the best selling dishes. All\n"
                    "meals are prepared fresh":
                    "Everyone's favourite dishes and\n"
                        "takeouts.",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white, fontFamily: "EBG", fontSize: 17)),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.009,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white),
                  child: const TextField(
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
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: widget.meal_page == "meals1" ?meals1.length:meals2.length,
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
                          size: const Size.fromRadius(48), // Image radius
                          child: Image.asset( widget.meal_page == "meals1" ?meals1[index].image:meals2[index].image)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              widget.meal_page == "meals1" ?meals1[index].meal_label:meals2[index].meal_label,
                              style: TextStyle(fontSize: 20),
                            ),
                            Container(
                              margin: EdgeInsets.only(top:10),
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.height * 0.05,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xFFFF785B)),
                              child: MaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (_) => Meal_Info(meal_index: index, meal_page: widget.meal_page)));
                                },
                                child: const Text(
                                  "Buy Now",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
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
        height: MediaQuery.of(context).size.height * 0.09,
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
                  icon: const Icon(Icons.home, color: Colors.grey),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                IconButton(
                  icon: const Icon(Icons.shopping_cart, color: Colors.grey),
                  onPressed: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (_) => const Shopping_Cart()));
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
