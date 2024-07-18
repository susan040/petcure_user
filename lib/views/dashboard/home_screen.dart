import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home-screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Text("Home Screen")],
      ),
    );
  }
}
