import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:menuavigation/screens/home/theme_notifier..dart';
import 'package:menuavigation/screens/home/home.dart';
import 'dependency_injection.dart';
import 'package:get/get.dart';

void main() async {
  DependencyInjection.init();
  runApp(
    ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeNotifier.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: Home(),
    );
  }
}
