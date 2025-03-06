import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcure_user/models/category.dart';
import 'package:petcure_user/repo/get_category_repo.dart';

class HomeScreenController extends GetxController {
  final searchController = TextEditingController();
  @override
  void onInit() {
    super.onInit();

    getAllCategories();
  }

  RxList<Categories> allCategories = <Categories>[].obs;
  final loading = RxBool(false);

  getAllCategories() async {
    loading.value = true;
    await GetCategoryRepo.getCategoryRepo(onSuccess: (meetings) {
      loading.value = false;
      allCategories.addAll(meetings);
    }, onError: ((message) {
      loading.value = false;
    }));
  }
}
