import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcure_user/views/dashboard/home_screen.dart';
import 'package:petcure_user/views/dashboard/profile_screen.dart';
import 'package:petcure_user/views/dashboard/shop_screen.dart';

class DashScreenController extends GetxController {
  final dashKey = GlobalKey<ScaffoldState>();
  RxList<Widget> pages = RxList([
    HomeScreen(), 
    ShopScreen(), 
    ProfileScreen()]);
  RxInt currentIndex = RxInt(0);

  void onItemTapped(int index) {
    currentIndex.value = index;
  }
}
