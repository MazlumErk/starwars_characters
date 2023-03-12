import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:star_wars_characters/Screens/HomeScreen.dart';
import 'Screens/LoadingScreen.dart';

void main() async {
  await Hive.initFlutter();
  var characterBox = await Hive.openBox('characterBox');
  var settingsBox = await Hive.openBox('settingsBox');
  if (settingsBox.get('pageNum') == null) {
    settingsBox.put('pageNum', 1);
  }
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/loading': (context) => const LoadingScreen(),
        '/home': (context) => const HomePage(),
      },
      debugShowCheckedModeBanner: false,
      home: const LoadingScreen(),
    );
  }
}
