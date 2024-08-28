import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcure_user/utils/colors.dart';
import 'package:petcure_user/utils/custom_text_style.dart';
import 'package:petcure_user/utils/image_path.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      appBar: AppBar(
        elevation: 2,
        centerTitle: false,
        backgroundColor: AppColors.extraWhite,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text("History",
            style: CustomTextStyles.f16W600(color: AppColors.textColor)),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 18, right: 18, top: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("History", style: CustomTextStyles.f18W600()),
            Text(
              "All of your previous hisotry will goes here",
              style: CustomTextStyles.f16W400(color: AppColors.lGrey),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      height: 55,
                      width: 100,
                      imageUrl:
                          "https://ecoglowcleaning.com/wp-content/uploads/2022/11/Cleaning-service-employees-wit.jpg",
                      errorWidget: (context, url, error) => Image.asset(
                        ImagePath.blankImage, // Replace with your asset path
                        height: 55,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Emily Johnson",
                            style: CustomTextStyles.f16W400()),
                        Text(
                          "Rs.800",
                          style:
                              CustomTextStyles.f16W600(color: AppColors.lGrey),
                        ),
                      ])
                ]),
                const Icon(
                  Icons.more_vert,
                  size: 24,
                )
              ],
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      height: 55,
                      width: 100,
                      imageUrl:
                          "https://ecoglowcleaning.com/wp-content/uploads/2022/11/Cleaning-service-employees-wit.jpg",
                      errorWidget: (context, url, error) => Image.asset(
                        ImagePath.blankImage, // Replace with your asset path
                        height: 55,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Emily Johnson",
                            style: CustomTextStyles.f16W400()),
                        Text(
                          "Rs.800",
                          style:
                              CustomTextStyles.f16W600(color: AppColors.lGrey),
                        ),
                      ])
                ]),
                const Icon(
                  Icons.more_vert,
                  size: 24,
                )
              ],
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      height: 55,
                      width: 100,
                      imageUrl:
                          "https://ecoglowcleaning.com/wp-content/uploads/2022/11/Cleaning-service-employees-wit.jpg",
                      errorWidget: (context, url, error) => Image.asset(
                        ImagePath.blankImage, // Replace with your asset path
                        height: 55,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Emily Johnson",
                            style: CustomTextStyles.f16W400()),
                        Text(
                          "Rs.800",
                          style:
                              CustomTextStyles.f16W600(color: AppColors.lGrey),
                        ),
                      ])
                ]),
                const Icon(
                  Icons.more_vert,
                  size: 24,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
