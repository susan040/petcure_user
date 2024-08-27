import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcure_user/utils/colors.dart';
import 'package:petcure_user/utils/custom_text_style.dart';
import 'package:petcure_user/utils/image_path.dart';
import 'package:petcure_user/views/dash_screen.dart';

class BookedSuccessScreen extends StatelessWidget {
  const BookedSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, top: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Get.offAll(() => DashScreen());
                  },
                  child: Container(
                    height: 27,
                    width: 27,
                    decoration: BoxDecoration(
                      color: AppColors.extraWhite,
                      boxShadow: const [
                        BoxShadow(
                          color: AppColors.lGrey,
                          blurRadius: 2.0,
                          offset: Offset(1, 1),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Center(
                        child: Icon(
                      Icons.close,
                      size: 16,
                    )),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 140),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(ImagePath.bookedSuccess),
                const SizedBox(height: 10),
                Text("Thank You", style: CustomTextStyles.f32W600()),
                Text("Purchase was Successful",
                    style: CustomTextStyles.f14W400(color: AppColors.lGrey)),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
