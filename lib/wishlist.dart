import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:warachow/profile.dart';
import 'package:warachow/shopping_cart.dart';

import 'adapters/meals_list.dart';
import 'adapters/wishlist_adapter.dart';
import 'mainPage.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  bool isLiked = true;
  int index1 = 0;

  late Box<Wishlist> wish_box;
  late Box<Meals_list> meals_box;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    wish_box = Hive.box("wishlist");
    meals_box = Hive.box("meal");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 25),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 12,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.only(left: 15),
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Wishlist",
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 15),
                  Divider(
                    color: Colors.grey[400],
                    height: 1,
                    thickness: 3,
                    endIndent: 30,
                  ),
                  SizedBox(height: 5),
                  Text(
                    "You have favourited ${wish_box.length} dishes",
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.55,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey[200],
              child: ListView.builder(
                itemCount: wish_box.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  if (wish_box.isEmpty) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Nothing to show",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              fontFamily: "EBG"),
                        ),
                      ],
                    );
                  } else {
                    return Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.3,
                              width: MediaQuery.of(context).size.width - 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(15),
                                      topLeft: Radius.circular(15)),
                                  color: Colors.teal),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15)),
                                  child: Image.asset(
                                      wish_box.getAt(index)!.image,
                                      fit: BoxFit.contain)),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.1,
                              width: MediaQuery.of(context).size.width - 30,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.08,
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFFF785B),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(15),
                                            bottomRight: Radius.circular(15))),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(wish_box.getAt(index)!.meal_label,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400)),
                                        Text("with Coke",
                                            style: TextStyle(fontSize: 13)),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.08,
                                    width: MediaQuery.of(context).size.width *
                                        0.15,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFFF785B),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            bottomLeft: Radius.circular(15))),
                                    child: IconButton(
                                      icon: Icon(
                                        isLiked == true
                                            ? CupertinoIcons.heart_fill
                                            : CupertinoIcons.heart,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if (isLiked == true) {
                                            isLiked = false;
                                            wish_box.deleteAt(index);
                                          } else {
                                            isLiked = true;
                                          }
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                width: MediaQuery.of(context).size.width - 30,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("💶 ${wish_box.getAt(index)!.price}",
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Color(0xFFFF785B),
                                            fontWeight: FontWeight.w600))
                                  ],
                                )),
                          ],
                        ),
                        SizedBox(width: 10)
                      ],
                    );
                  }
                },
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xFFFF785B)),
                    child: MaterialButton(
                        onPressed: () {
                          if (wish_box.length != 0) {
                            int length = wish_box.length;
                            while (index1 != length) {
                              meals_box.add(Meals_list(
                                  meal_label: wish_box.getAt(index1)!.meal_label,
                                  price: wish_box.getAt(index1)!.price,
                                  image: wish_box.getAt(index1)!.image,
                                  amount: wish_box.getAt(index1)!.amount));
                              index1++;
                            }
                            Navigator.push(context, CupertinoPageRoute(builder: (_)=>Shopping_Cart()));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                              "Your Wishlist is Empty",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            )));
                          }
                        },
                        child: Text(
                          "Buy Now",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        )),
                  )
                ],
              ),
            )
          ],
        ),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (_) => Main_Page()));
                  },
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                IconButton(
                    icon: Icon(Icons.arrow_back_ios_new),
                    color: Colors.grey,
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
