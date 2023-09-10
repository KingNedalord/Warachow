import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:warachow/profile.dart';

import 'adapters/meals_list.dart';
import 'checkout_page.dart';
import 'mainPage.dart';

class Shopping_Cart extends StatefulWidget {
  const Shopping_Cart({super.key});

  @override
  State<Shopping_Cart> createState() => _Shopping_CartState();
}

class _Shopping_CartState extends State<Shopping_Cart> {
  late Box<Meals_list> meals_box;
  int total_price = 0;
  int index1 = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    meals_box = Hive.box("meal");
    int length = meals_box.length;
    while (index1 != length) {
      total_price = total_price +
          meals_box.getAt(index1)!.price * meals_box.getAt(index1)!.amount;
      index1++;
    }
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
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10),
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
                            return Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.28,
                                    child: ClipOval(
                                      child: SizedBox.fromSize(
                                          size: Size.fromRadius(40),
                                          child: Image.asset(
                                              meals_box.getAt(index)!.image)),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                            0.72 -
                                        24,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "    ${meals_box.getAt(index)!.meal_label}",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: "EBG"),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                IconButton(
                                                    icon: Icon(
                                                        CupertinoIcons.minus,
                                                        size: 15),
                                                    onPressed: () {
                                                      setState(() {
                                                        if (meals_box
                                                                .getAt(index)!
                                                                .amount >
                                                            1) {
                                                          meals_box.putAt(
                                                              index,
                                                              Meals_list(
                                                                  meal_label: meals_box
                                                                      .getAt(
                                                                          index)!
                                                                      .meal_label,
                                                                  price: meals_box
                                                                      .getAt(
                                                                          index)!
                                                                      .price,
                                                                  image: meals_box
                                                                      .getAt(
                                                                          index)!
                                                                      .image,
                                                                  amount: meals_box
                                                                          .getAt(
                                                                              index)!
                                                                          .amount -
                                                                      1));
                                                          total_price =
                                                              total_price -
                                                                  meals_box
                                                                      .getAt(
                                                                          index)!
                                                                      .price;
                                                        }
                                                      });
                                                    }),
                                                Container(
                                                    width: 30,
                                                    height: 20,
                                                    color: Colors.grey,
                                                    child: Text(
                                                        "${meals_box.getAt(index)!.amount}",
                                                        style: TextStyle(
                                                            fontSize: 17),
                                                        textAlign:
                                                            TextAlign.center)),
                                                IconButton(
                                                    icon: Icon(
                                                        CupertinoIcons.plus,
                                                        size: 15),
                                                    onPressed: () {
                                                      setState(() {
                                                        meals_box.putAt(
                                                            index,
                                                            Meals_list(
                                                                meal_label: meals_box
                                                                    .getAt(
                                                                        index)!
                                                                    .meal_label,
                                                                price: meals_box
                                                                    .getAt(
                                                                        index)!
                                                                    .price,
                                                                image: meals_box
                                                                    .getAt(
                                                                        index)!
                                                                    .image,
                                                                amount: meals_box
                                                                        .getAt(
                                                                            index)!
                                                                        .amount +
                                                                    1));
                                                        total_price =
                                                            total_price +
                                                                meals_box
                                                                    .getAt(
                                                                        index)!
                                                                    .price;
                                                      });
                                                    }),
                                              ],
                                            ),
                                            Row(children: [
                                              Text(
                                                  "💶${meals_box.getAt(index)!.price * meals_box.getAt(index)!.amount}",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                              IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      total_price = total_price -
                                                          meals_box
                                                                  .getAt(index)!
                                                                  .price *
                                                              meals_box
                                                                  .getAt(index)!
                                                                  .amount;
                                                      meals_box.deleteAt(index);
                                                    });
                                                  },
                                                  icon: Icon(
                                                    Icons.close,
                                                    size: 15,
                                                    color: Colors.red,
                                                  ))
                                            ])
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
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
                    padding: EdgeInsets.only(bottom: 15),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.17,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Divider(
                            indent: 15,
                            endIndent: 15,
                            color: Colors.grey,
                            thickness: 1),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Purchase Total",
                                textAlign: TextAlign.end,
                                style: TextStyle(fontSize: 18)),
                            Text("Voucher Code?",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 18, color: Color(0xFFFF785B))),
                            Text("Vat 5%",
                                textAlign: TextAlign.end,
                                style: TextStyle(fontSize: 18))
                          ],
                        ),
                        SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("💶 ${total_price}",
                                style: TextStyle(fontSize: 18),
                                textAlign: TextAlign.center),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.26,
                              height: MediaQuery.of(context).size.height * 0.05,
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hoverColor: Color(0xFFFF785B),
                                    hintText: "Enter here"),
                              ),
                            ),
                            Text("💶 ${(total_price / 100 * 5).round()}",
                                style: TextStyle(fontSize: 18),
                                textAlign: TextAlign.center)
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                        color: Color(0xFFFF785B)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Sub Total     💶 ${total_price + (total_price / 100 * 5).round()}     ",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: MediaQuery.of(context).size.height * 0.05,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xFFFF785B)),
                  child: MaterialButton(
                    onPressed: () {
                      // setState(() {
                      //   int index2 = 0;
                      //   int length = meals_box.length;
                      //   while (index2 != length){
                      //     meals_box.deleteAt(index2);
                      //     index2++;
                      //     total_price = 0 ;
                      //   }
                      // });
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (_) => Checkout_Page()));
                    },
                    child: Text(
                      "Checkout",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
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
                    icon: Icon(Icons.shopping_cart),
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
