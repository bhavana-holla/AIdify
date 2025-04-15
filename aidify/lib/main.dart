import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/detail_screen.dart';

void main() {
  runApp(FirstAidApp());
}

class FirstAidApp extends StatelessWidget {
  const FirstAidApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Aid App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomeScreen(),
      routes: {
        DetailScreen.routeName: (ctx) => DetailScreen(),
      },
    );
  }
}
