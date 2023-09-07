import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:warachow/profile.dart';

import 'adapters/meals_list.dart';
import 'mainPage.dart';

class Shopping_Cart extends StatefulWidget {
  const Shopping_Cart({super.key});

  @override
  State<Shopping_Cart> createState() => _Shopping_CartState();
}

class _Shopping_CartState extends State<Shopping_Cart> {
  late Box<Meals_list> meals_box;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    meals_box = Hive.box("meal");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 25),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Color(0xFFFBEDEA),
      body: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Your Shopping Cart",
                      style: TextStyle(
                          fontSize: 30,
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
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.55,
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.33,
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  color: Colors.pink,
                                ),
                                Column(
                                  children: [
                                    Text(meals_box.getAt(index)!.meal_label),
                                    Row(
                                      children: [
                                        IconButton(
                                            icon: Icon(CupertinoIcons.minus,
                                                size: 15),
                                            onPressed: () {
                                              setState(() {
                                                if (meals_box.getAt(index)!.amount > 1) {
                                                  meals_box.putAt(index, Meals_list(meal_label: meals_box.getAt(index)!.meal_label, price: meals_box.getAt(index)!.price, image: meals_box.getAt(index)!.image, amount: meals_box.getAt(index)!.amount - 1));

                                                }
                                              });
                                            }),
                                        Container(
                                            width: 20,
                                            height: 20,
                                            color: Colors.grey,
                                            child: Text(
                                                "${meals_box.getAt(index)!.amount}",
                                                style: TextStyle(fontSize: 17),
                                                textAlign: TextAlign.center)),
                                        IconButton(
                                            icon: Icon(CupertinoIcons.plus,
                                                size: 15),
                                            onPressed: () {
                                              setState(() {
                                                meals_box.putAt(
                                                    index,
                                                    Meals_list(meal_label: meals_box.getAt(index)!.meal_label, price: meals_box.getAt(index)!.price, image: meals_box.getAt(index)!.image, amount: meals_box.getAt(index)!.amount + 1));
                                              });
                                            }),
                                      ],
                                    )
                                  ],
                                ),
                                Row(children: [
                                  Text(
                                      "💶${meals_box.getAt(index)!.price * meals_box.getAt(index)!.amount}",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500))
                                ])
                              ],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider(
                              height: 2,
                              color: Colors.grey[500],
                              indent: 10,
                              endIndent: 10,
                            );
                          },
                          itemCount: meals_box.length)),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.17,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.05,
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
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (_) => Main_Page()));
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
