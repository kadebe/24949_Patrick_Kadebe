import 'package:flutter/material.dart';
import 'package:menuavigation/screens/calculator/calculator.dart';
import 'package:menuavigation/screens/home/home.dart';
import 'package:menuavigation/screens/login/login.dart';
import 'package:menuavigation/screens/signup/signup.dart';
import 'package:menuavigation/screens/buttomTabBar/FabTabs.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Text('Patrick Kadebe',
                style: TextStyle(color: Colors.white, fontSize: 25)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(1.0),
                  bottomRight: Radius.circular(1.0),
                ),
                color: Color(0xffB81736),
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage('assets/images.jpeg'))),
          ),
          ListTile(
            leading: Icon(Icons.home_filled),
            title: Text("Home"),
            onTap: () => {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FabTabs(selectedIndex: 0)))
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile"),
            onTap: () => {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FabTabs(selectedIndex: 1)))
            },
          ),
          ListTile(
            leading: Icon(Icons.person_add),
            title: Text("Signup"),
            onTap: () => {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FabTabs(selectedIndex: 2)))
            },
          ),
          ListTile(
            leading: Icon(Icons.calculate),
            title: Text("Calculator"),
            onTap: () => {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FabTabs(selectedIndex: 3)))
            },
          )
        ],
      ),
    );
  }
}
