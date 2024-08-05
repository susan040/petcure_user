import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:petcure_user/controller/dashboard/product_desc_controller.dart';
import 'package:petcure_user/utils/colors.dart';
import 'package:petcure_user/utils/custom_text_style.dart';
import 'package:petcure_user/utils/image_path.dart';

class DoctorDescWidget extends StatelessWidget {
  const DoctorDescWidget({
    super.key,
    required this.image,
    required this.number,
    required this.text,
  });
  final String image;
  final String number;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
            child: SvgPicture.asset(image),
          ),
        ),
        const SizedBox(height: 8),
        Text(number, style: CustomTextStyles.f14W600()),
        Text(text, style: CustomTextStyles.f14W400()),
      ],
    );
  }
}

class StarWidget extends StatelessWidget {
  const StarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.amber,
          size: 18,
        ),
        Icon(
          Icons.star,
          color: Colors.amber,
          size: 18,
        ),
        Icon(
          Icons.star,
          color: Colors.amber,
          size: 18,
        ),
        Icon(
          Icons.star,
          color: Colors.amber,
          size: 18,
        ),
        Icon(
          Icons.star_half,
          color: Colors.amber,
          size: 18,
        ),
      ],
    );
  }
}

class ReviewsWidget extends StatelessWidget {
  const ReviewsWidget({
    super.key,
    required this.controller,
  });

  final ProductDescController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 14, right: 14, top: 14),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.extraWhite,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 0.5, color: AppColors.lGrey)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Dibin s. | 2 years ago", style: CustomTextStyles.f14W600()),
              Row(
                children: [
                  InkWell(onTap: () {
                    controller.toggleLike();
                  }, child: Obx(() {
                    return SvgPicture.asset(
                      controller.isLiked.value
                          ? ImagePath.loveFill
                          : ImagePath.love,
                      // color: controller.isLiked.value
                      //     ? AppColors.errorColor
                      //     : null,
                    );
                  })),
                  const SizedBox(width: 4),
                  Text(
                    "2",
                    style: CustomTextStyles.f14W400(
                        color: AppColors.secondaryTextColor),
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 5),
          const StarWidget(),
          const SizedBox(height: 6),
          Text(
            "Our cats loves this! They really thrive on Whiskas and there's not one piece they won't eat. I think this is a high-quality food, plus it looks and smells good too.",
            style: CustomTextStyles.f14W400(),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 10),
          const Divider(
            thickness: 0.5,
            color: AppColors.lGrey,
          ),
          const SizedBox(height: 8.5),
          InkWell(
            onTap: () {},
            child: Center(
              child: Text("View All",
                  style:
                      CustomTextStyles.f14W700(color: AppColors.primaryColor)),
            ),
          )
        ],
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final bool isActive;

  const Dot({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      width: isActive ? 12.0 : 8.0,
      height: isActive ? 12.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primaryColor : AppColors.secondaryColor,
        shape: BoxShape.circle,
      ),
    );
  }
}

class SimilarProduct extends StatelessWidget {
  const SimilarProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 208,
      width: Get.width / 2.2,
      decoration: BoxDecoration(
        color: AppColors.extraWhite,
        border: Border.all(width: 0.5, color: AppColors.lGrey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Center(
            child: Image.asset(
              ImagePath.product,
              height: 90,
              width: 118,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 3),
            child: Text(
              "Oxbow Simple Rewards Bell Pepper Treats",
              style: CustomTextStyles.f12W600(),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 3),
            child: Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 16,
                ),
                Text(
                  "4.3/5 (48)| 12 Sold",
                  style: CustomTextStyles.f10W400(color: AppColors.lGrey),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Text(
              "Rs.450",
              style: CustomTextStyles.f12W600(color: AppColors.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
