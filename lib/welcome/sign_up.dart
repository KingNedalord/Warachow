import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:warachow/adapters/information.dart';
import 'package:warachow/mainPage.dart';

// import 'main.dart';

class Sign_Up extends StatefulWidget {
  const Sign_Up({super.key});

  @override
  State<Sign_Up> createState() => _Sign_UpState();
}

class _Sign_UpState extends State<Sign_Up> {

  TextEditingController loginContr = TextEditingController();
  TextEditingController passwordContr = TextEditingController();

  bool? text;
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
      backgroundColor: Color(0xFFFBEDEA),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.08),
          Image.asset(
            "assets/logomock.png",
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          Text(
            "Registration",
            style: TextStyle(fontSize: 40, fontFamily: "EBG"),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: loginContr,
              decoration: InputDecoration(
                  hintText: "Your Name",
                  border: OutlineInputBorder(
                      gapPadding: 20,
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: passwordContr,
              obscureText: true,
              decoration: const InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(
                      gapPadding: 20,
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            ),
          ),
          SizedBox(height: 10),
          ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              child: MaterialButton(
                onPressed: () async {
                  if (loginContr.value.text != "" &&
                      passwordContr.value.text != "") {
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    text = await pref.setBool('txt', true);

                    Information information = Information(
                        name: loginContr.value.text,
                        password: passwordContr.value.text,
                        email: "example@gmail.com",
                        date_of_birth: "00-00-0000",
                        address: "-");
                    box.add(information);  print(box.get("info"));
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (_) => Main_Page()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("All fields must be filled")));
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    text = await pref.setBool('txt', false);
                  }
                },
                color: Color(0xFFFF785B),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Never Hungry Again!",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: "EBG")),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
