import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:warachow/mainPage.dart';

import 'adapters/information.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController emailcontr = TextEditingController();
  TextEditingController datecontr = TextEditingController();
  TextEditingController addresscontr = TextEditingController();
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
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 25),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Profile",
                  style: TextStyle(
                      fontSize: 40,
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
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.33,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RotatedBox(
                  quarterTurns: -1,
                  child: Text(
                    box.getAt(0)!.name,
                    style: TextStyle(color: Colors.black, fontSize: 35),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.37,
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width * 0.08),
                    Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            border: Border.all(color: Colors.grey, width: 1)),
                        width: MediaQuery.of(context).size.width * 0.75,
                        height: MediaQuery.of(context).size.height * 0.06,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "  Email:",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(box.getAt(0)!.email)
                          ],
                        )),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                    Icon(
                        box.getAt(0)!.email != ""
                            ? CupertinoIcons.check_mark_circled
                            : Icons.close,
                        color:  box.getAt(0)!.email != "" ? Colors.green : Colors.red),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width * 0.08),
                    Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            border: Border.all(color: Colors.grey, width: 1)),
                        width: MediaQuery.of(context).size.width * 0.75,
                        height: MediaQuery.of(context).size.height * 0.06,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "  Date Of Birth:",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(box.getAt(0)!.date_of_birth)
                          ],
                        )),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                    Icon(
                        box.getAt(0)!.date_of_birth != ""
                            ? CupertinoIcons.check_mark_circled
                            : Icons.close,
                        color: box.getAt(0)!.date_of_birth != "" ? Colors.green : Colors.red),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width * 0.08),
                    Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            border: Border.all(color: Colors.grey, width: 1)),
                        width: MediaQuery.of(context).size.width * 0.75,
                        height: MediaQuery.of(context).size.height * 0.12,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "  Address:",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(box.getAt(0)!.address)
                          ],
                        )),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                    Icon(
                        box.getAt(0)!.address != ""
                            ? CupertinoIcons.check_mark_circled
                            : Icons.close,
                        color: box.getAt(0)!.address != "" ?Colors.green : Colors.red),
                  ],
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey[600]!)),
            child: MaterialButton(
                onPressed: () {
                  emailcontr.text = box.getAt(0)!.email;
                  datecontr.text = box.getAt(0)!.date_of_birth;
                  addresscontr.text = box.getAt(0)!.address;
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Edit window"),
                          content: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.32,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: emailcontr,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: "Enter email",
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: datecontr,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: "Enter birth date",
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: addresscontr,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: "Enter Address",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Cancel")),
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    if (emailcontr.value.text != "" &&
                                        datecontr.value.text != "" &&
                                        addresscontr.value.text != "") {
                                      Information info = Information(
                                          name: box.getAt(0)!.name,
                                          password: box.getAt(0)!.password,
                                          email: emailcontr.value.text,
                                          date_of_birth: datecontr.value.text,
                                          address: addresscontr.value.text);
                                      box.putAt(0, info);
                                      Navigator.pop(context);
                                    }
                                  });
                                },
                                child: Text("Save")),
                          ],
                        );
                      });
                },
                child: Text(
                  "Edit Profile",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  textAlign: TextAlign.center,
                )),
          )
        ],
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
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
