import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcure_user/utils/theme.dart';
import 'package:petcure_user/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: basicTheme(),
      themeMode: ThemeMode.light,
      home: SplashScreen(),
    );
  }
}
