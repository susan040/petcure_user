import 'package:flutter/material.dart';

class ShopScreen extends StatelessWidget {
  static String routeName = "/shop-screen";
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Text("Shop Screen")],
      ),
    );
  }
}