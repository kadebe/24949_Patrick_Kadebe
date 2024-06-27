import 'package:flutter/material.dart';
import 'package:menuavigation/screens/calculator/calculator.dart';
import 'package:menuavigation/screens/home/home.dart';
import 'package:menuavigation/screens/login/login.dart';
import 'package:menuavigation/screens/profile/profile.dart';
import 'package:menuavigation/screens/signup/signup.dart';

class FabTabs extends StatefulWidget {
  int selectedIndex = 0;

  FabTabs({required this.selectedIndex});

  @override
  State<FabTabs> createState() => _FabTabsState();
}

class _FabTabsState extends State<FabTabs> {
  int currentIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
      currentIndex = widget.selectedIndex;
    });
  }

  @override
  void initState() {
    onItemTapped(widget.selectedIndex);
    // TODO: implement initState
    super.initState();
  }

  final List<Widget> pages = [Home(), Login(), Signup(), Calculator()];

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = currentIndex == 0
        ? Home()
        : currentIndex == 1
            ? Login()
            : currentIndex == 2
                ? Signup()
                : Calculator();
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: Icon(Icons.add),
        onPressed: () {
          print("add fab button");
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 50,
                    onPressed: () {
                      setState(() {
                        currentScreen = Home();
                        currentIndex = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home_filled,
                          color: currentIndex == 0
                              ? Color(0xffB81736)
                              : Colors.grey,
                        ),
                        Text(
                          "Home",
                          style: TextStyle(
                              color: currentIndex == 0
                                  ? Color(0xffB81736)
                                  : Colors.grey),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 50,
                    onPressed: () {
                      setState(() {
                        currentScreen = Profile();
                        currentIndex = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: currentIndex == 1
                              ? Colors.pinkAccent
                              : Colors.grey,
                        ),
                        Text(
                          "Login",
                          style: TextStyle(
                              color: currentIndex == 1
                                  ? Colors.pinkAccent
                                  : Colors.grey),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 50,
                    onPressed: () {
                      setState(() {
                        currentScreen = Calculator();
                        currentIndex = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person_add,
                          color: currentIndex == 2
                              ? Color(0xffB81736)
                              : Colors.grey,
                        ),
                        Text(
                          "SignUp",
                          style: TextStyle(
                              color: currentIndex == 2
                                  ? Color(0xffB81736)
                                  : Colors.grey),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 50,
                    onPressed: () {
                      setState(() {
                        currentScreen = Login();
                        currentIndex = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.calculate,
                          color: currentIndex == 3
                              ? Color(0xffB81736)
                              : Colors.grey,
                        ),
                        Text(
                          "Calculator",
                          style: TextStyle(
                              color: currentIndex == 3
                                  ? Color(0xffB81736)
                                  : Colors.grey),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
