import 'package:get/get.dart';

class ProductDescController extends GetxController {
  var sliderValue = 0.0.obs; // Observable variable for slider value

  void updateSliderValue(double value) {
    sliderValue.value = value;
  }

  // Optional method to determine which dot is active based on the slider value
  List<bool> getActiveDots() {
    return List.generate(4, (index) {
      return (index * 33.33) <= sliderValue.value;
    });
  }

  var currentPage = 0.obs; // Observable variable for current page index
  final List<String> images = [
    'assets/icons/product1.png',
    'assets/icons/product1.png',
    'assets/icons/product1.png',
    'assets/icons/product1.png',
  ]; // List of image paths

  void updatePageIndex(int index) {
    currentPage.value = index;
  }
}
