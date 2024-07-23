import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petcure_user/utils/colors.dart';
import 'package:petcure_user/utils/custom_text_style.dart';

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
