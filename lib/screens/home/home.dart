import 'package:flutter/material.dart';
import 'package:menuavigation/screens/drawer/sidemenu.dart';
import 'package:menuavigation/screens/login/login.dart';
import 'package:menuavigation/screens/signup/signup.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      appBar: AppBar(
        title: Text("Home", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xffB81736),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xffB81736),
          Color(0xff281537),
        ])),
        child: Column(children: [
          const Padding(
              padding: EdgeInsets.only(top: 200.0),
              child: Text("patrick kadebe",
                  style: TextStyle(fontSize: 50, color: Colors.white))),
          const SizedBox(
            height: 100,
          ),
          const Text(
            'Welcome Back',
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          const SizedBox(
            height: 30,
          ),

          const SizedBox(
            height: 30,
          ),

          const Spacer(),
          const Text(
            'Surfing in our website is an opportunity for your',
            style: TextStyle(fontSize: 17, color: Colors.white),
          ), //
          const SizedBox(
            height: 12,
          ),
        ]),
      ),
    );
  }
}
