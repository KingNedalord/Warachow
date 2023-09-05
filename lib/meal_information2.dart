import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'meals_list.dart';

class Meal_Information2 extends StatefulWidget {
  final meal_index2;
  const Meal_Information2({super.key,required this.meal_index2});

  @override
  State<Meal_Information2> createState() => _Meal_Information2State();
}

class _Meal_Information2State extends State<Meal_Information2> {
  @override
  Widget build(BuildContext context) {

    bool isLiked = false;
    List<Meals_list> meals = [
      Meals_list(meal_label: "Beef Burger", price: 5, image: "assets/21.png"),
      Meals_list(meal_label: "Shawarma", price: 6, image: "assets/22.png"),
      Meals_list(meal_label: "Pizza Peperoni", price: 8, image: "assets/24.png"),
      Meals_list(meal_label: "Cheesy Bread", price: 3, image: "assets/14.png"),
      Meals_list(meal_label: "Amala", price: 10, image: "assets/15.png"),
      Meals_list(meal_label: "Jollof Spaghetti", price: 5, image: "assets/26.png")
    ];

    return Scaffold(
      body: Column(
        children: [
          InkWell(
            onDoubleTap: () {
              setState(() {
                if (isLiked == false) {
                  isLiked = true;
                } else {
                  isLiked = false;
                }
              });
            },
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.4,
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.4,
                      color: Colors.teal,
                    ),
                    Positioned(
                      right: 2,
                      top: 5,
                      child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.transparent,
                            border: Border.all(color: Colors.white)),
                        child: Text(
                          meals[widget.meal_index2].meal_label,
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: Image.asset(meals[widget.meal_index2].image)),
                      ],
                    ),
                    Positioned(
                      right: 1,
                      bottom: 1,
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              if (isLiked == false) {
                                isLiked = true;
                              } else {
                                isLiked = false;
                              }
                            });
                          },
                          icon: Icon(
                              isLiked == false
                                  ? CupertinoIcons.heart
                                  : CupertinoIcons.heart_fill,
                              color: Colors.white)),
                    )
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 8),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.45,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Description",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.w500)),
                            SizedBox(height: 10),
                            Text(
                              "Our Friends Rice Is Made From\n"
                                  "The Finest Ingredients And\n"
                                  "Veggies. Every Single Dish Is\n"
                                  "Made with Fresh Vegetables\n"
                                  "Each Plate Is Served With Our\n"
                                  "Signature Chicken And A Free",
                              style:
                              TextStyle(fontSize: 12, color: Colors.grey),
                              textAlign: TextAlign.start,
                            )
                          ],
                        ),
                        Expanded(child: Image.asset("assets/reviews.png"))
                      ]),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ingredients",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 15),
                      Image.asset("assets/ingredients.png"),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.05,

                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Color(0xFFFF785B)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "💶 ${meals[widget.meal_index2].price}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                        Text("Order Now ->",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18)),
                        Icon(Icons.shopping_cart,color: Colors.white,)
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
