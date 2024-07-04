import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:menuavigation/screens/home/theme_notifier..dart'; // Adjust the path accordingly
import 'package:menuavigation/screens/drawer/sidemenu.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const platform = MethodChannel('com.example.battery_notifier/battery');

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    Color textColor = themeNotifier.isDarkMode ? Colors.white : Colors.black;

    return Scaffold(
      drawer: SideMenu(),
      appBar: AppBar(
        title: const Text("Home", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xff8563ab),
        actions: [
          Switch(
            value: themeNotifier.isDarkMode,
            onChanged: (value) {
              themeNotifier.toggleTheme();
            },
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: themeNotifier.isDarkMode
                ? [const Color(0xff070707), const Color(0xff111328)]
                : [const Color(0xffffffff), const Color(0xffffffff)],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 200.0),
                child: Text("Welcome Back", style: TextStyle(fontSize: 50)),
              ),
              const SizedBox(height: 100),
              ElevatedButton(
                onPressed: _getBatteryLevel,
                child: const Text('Get Battery Level'),
              ),
              const SizedBox(height: 20),
              Text(
                'Check console for battery level',
                style: TextStyle(fontSize: 17, color: textColor),
              ),
              const Spacer(),
              const Text(
                'Surfing in our website is an opportunity for you',
                style: TextStyle(fontSize: 17),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _getBatteryLevel() async {
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      print('Battery level is $result%');
    } on PlatformException catch (e) {
      print('Failed to get battery level: ${e.message}');
    }
  }
}
