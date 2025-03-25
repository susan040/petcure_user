import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:petcure_user/controller/dashboard/profile_screen_controller.dart';
import 'package:petcure_user/utils/colors.dart';
import 'package:petcure_user/utils/custom_text_style.dart';
import 'package:petcure_user/utils/image_path.dart';
import 'package:petcure_user/utils/validator.dart';
import 'package:petcure_user/widgets/custom/custom_textfield.dart';

class EditProfileScreen extends StatelessWidget {
  static String routeName = "/edit-profile-screen";
  final c = Get.put(ProfileScreenController());

  EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      appBar: AppBar(
        elevation: 2,
        centerTitle: false,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text("Profile Setting",
            style: CustomTextStyles.f16W600(color: AppColors.textColor)),
        actions: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: InkWell(
              onTap: () {
                c.submit();
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 18),
                child: SvgPicture.asset(ImagePath.tick),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: c.formKey,
          child: Column(children: [
            const SizedBox(height: 40),
            Obx(() => ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: (c.image.value != null)
                      ? Image.file(
                          c.image.value!,
                          fit: BoxFit.cover,
                          height: 100,
                          width: 100,
                        )
                      : CachedNetworkImage(
                          placeholder: (context, url) => const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator()),
                          fit: BoxFit.cover,
                          height: 100,
                          width: 100,
                          imageUrl: c.avatarUrl.value!,
                          errorWidget: (context, url, error) => Image.network(
                            "https://edu.ceskatelevize.cz/storage/video/placeholder.jpg",
                            fit: BoxFit.cover,
                            height: 100,
                            width: 100,
                          ),
                        ),
                )),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                c.pickImage();
              },
              child: Text(
                "Change Avatar",
                style: CustomTextStyles.f14W600(color: AppColors.primaryColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, top: 30),
              child: Column(
                children: [
                  CustomTextField(
                      controller: c.nameController,
                      validator: Validators.checkFieldEmpty,
                      hint: "Enter your Full Name",
                      preIconPath: Icons.person,
                      preIconSize: 22,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.text),
                  const SizedBox(height: 30),
                  CustomTextField(
                      controller: c.addressController,
                      validator: Validators.checkFieldEmpty,
                      hint: "Enter your address",
                      preIconPath: Icons.house_sharp,
                      preIconSize: 21,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.text),
                  const SizedBox(height: 30),
                  IntlPhoneField(
                    controller: c.phoneController,
                    decoration: InputDecoration(
                      hintText: "Enter Phone No",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            width: 1, color: AppColors.secondaryTextColor),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            width: 1, color: AppColors.errorColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            width: 1, color: AppColors.primaryColor),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            width: 1, color: AppColors.errorColor),
                      ),
                      hintStyle: CustomTextStyles.f16W400(
                          color: AppColors.secondaryTextColor),
                    ),
                    style: CustomTextStyles.f16W400(
                      color: (AppColors.textColor),
                    ),
                    dropdownTextStyle: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                    initialCountryCode: 'NP',
                    showDropdownIcon: false,
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                      controller: c.genderController,
                      validator: Validators.checkFieldEmpty,
                      hint: "Enter your gender",
                      preIconPath: Icons.people,
                      preIconSize: 21,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.text),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
