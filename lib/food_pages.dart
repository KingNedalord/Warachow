import 'package:cloud_firestore/cloud_firestore.dart';
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

  const Food_Pages({super.key, required this.meal_page});

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

  Future<List<Main_Dishes>> main_dishes() async {
    List<Main_Dishes> main_meals = [];
    List<Main_Dishes> best_sellers = [];
    if (widget.meal_page == "meals1") {
      await FirebaseFirestore.instance
          .collection("main_dishes")
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var m in querySnapshot.docs) {
          main_meals.add(
            Main_Dishes(
              label: m.get('text'),
              price: m.get('price'),
              image: m.get('image'),
            ),
          );
        }
      });
      return main_meals;
    } else {
      await FirebaseFirestore.instance
          .collection("Best Sellers")
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var m in querySnapshot.docs) {
          best_sellers.add(
            Main_Dishes(
              label: m.get('text'),
              price: m.get('price'),
              image: m.get('image'),
            ),
          );
        }
      });
      return best_sellers;
    }
  }

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
                Text(
                  widget.meal_page == "meals1" ? "Main Dishes" : "Best Sellers",
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
                    widget.meal_page == "meals1"
                        ? "Find the best selling dishes. All\n"
                            "meals are prepared fresh"
                        : "Everyone's favourite dishes and\n"
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
            itemCount: 6,
            itemBuilder: (context, index) {
              return FutureBuilder(
                future: main_dishes(),
                builder: (context, snapshot) {
                  if (snapshot.hasError || !snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return Container(
                      margin: EdgeInsets.only(
                        left: index % 2 == 0 ? 12 : 0,
                        right: index % 2 == 0 ? 0 : 12,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom:
                              BorderSide(color: Colors.grey[400]!, width: 4),
                        ),
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            // Image border
                            child: SizedBox.fromSize(
                              size: Size.fromRadius(48), // Image radius
                              child: Image.asset(snapshot.data![index].image),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    snapshot.data![index].label,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0xFFFF785B)),
                                    child: MaterialButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            CupertinoPageRoute(
                                                builder: (_) => Meal_Info(
                                                    meal_index: index,
                                                    meal_page:
                                                        widget.meal_page)));
                                      },
                                      child: Text(
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
                  }
                },
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
                  icon: Icon(Icons.home, color: Colors.grey),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                IconButton(
                  icon: Icon(Icons.shopping_cart, color: Colors.grey),
                  onPressed: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (_) => Shopping_Cart()));
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
