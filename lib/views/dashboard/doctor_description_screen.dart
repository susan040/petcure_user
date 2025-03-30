import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcure_user/utils/colors.dart';
import 'package:petcure_user/utils/custom_text_style.dart';
import 'package:petcure_user/utils/image_path.dart';
import 'package:petcure_user/views/dashboard/appointment_booking_screen.dart';
import 'package:petcure_user/widgets/custom/elevated_button.dart';
import 'package:petcure_user/widgets/description_screen_widget.dart';

class DescriptionScreen extends StatelessWidget {
  static String routname = "description-screen";
  const DescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Section
              Stack(
                children: [
                  Image.network(
                    'https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg',
                    width: double.infinity,
                    height: 304,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: InkWell(
                      onTap: () => Get.back(),
                      child: const Icon(
                        Icons.arrow_back,
                        color: AppColors.textColor,
                      ),
                    ),
                  ),
                  Positioned(
                      child: Container(
                          margin: const EdgeInsets.only(top: 250),
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              color: AppColors.extraWhite,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40))),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 18, right: 18, top: 80, bottom: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    DoctorDescWidget(
                                        image: ImagePath.patients,
                                        number: "20000+",
                                        text: "patients"),
                                    DoctorDescWidget(
                                        image: ImagePath.rate,
                                        number: "5",
                                        text: "rating"),
                                    DoctorDescWidget(
                                        image: ImagePath.experience,
                                        number: "10+",
                                        text: "experience"),
                                    DoctorDescWidget(
                                        image: ImagePath.rate,
                                        number: "3,642",
                                        text: "reviews")
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Text('About Me',
                                    style: CustomTextStyles.f16W600()),
                                const SizedBox(height: 6),
                                Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam a porttitor turpis. Donec aliquam ac nisi eu cursus. In sagittis vitae erat quis condimentum. Nulla rutrum ligula nec tortor volutpat, sit amet iaculis lacus accumsan. Curabitur nec condimentum augue, a laoreet orci. Maecenas vitae lacinia felis. Aliquam mi nibh, pharetra sed hendrerit ac, accumsan vel magna. Fusce gravida nisl sed porttitor malesuada.',
                                  style: CustomTextStyles.f14W400(),
                                  textAlign: TextAlign.justify,
                                ),
                                const SizedBox(height: 20),

                                Text('Working Information',
                                    style: CustomTextStyles.f16W600()),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.calendar_today,
                                      size: 18,
                                      color: AppColors.lGrey,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Sunday - Monday, 08:00 AM - 05:00 PM',
                                      style: CustomTextStyles.f14W400(
                                          color: AppColors.lGrey),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const Icon(Icons.location_on,
                                        size: 18, color: AppColors.lGrey),
                                    const SizedBox(width: 8),
                                    Text('Chauthe Pokhara -14, Street no 9',
                                        style: CustomTextStyles.f14W400(
                                            color: AppColors.lGrey)),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                // Reviews Section
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Reviews',
                                        style: CustomTextStyles.f16W600()),
                                    Text('View all',
                                        style: CustomTextStyles.f14W400(
                                            color: AppColors.primaryColor)),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const CircleAvatar(
                                        minRadius: 21,
                                        backgroundImage: NetworkImage(
                                            "https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg")),
                                    const SizedBox(width: 16),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Emily Johnson',
                                            style: CustomTextStyles.f14W600()),
                                        const SizedBox(height: 3),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "4.5",
                                              style: CustomTextStyles.f14W400(),
                                            ),
                                            const SizedBox(width: 3),
                                            const StarWidget(),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                SizedBox(
                                  width: Get.width / 1.1,
                                  child: Text(
                                    'Dr. Jane Smith is an exceptional physician who takes the time to listen and thoroughly address all concerns. Her compassionate approach and clear explanations make every visit reassuring and informative.',
                                    style: CustomTextStyles.f14W400(),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ],
                            ),
                          ))),
                  Positioned(
                    top: 200,
                    left: 63,
                    child: Container(
                        width: 249,
                        height: 102,
                        decoration: BoxDecoration(
                            color: AppColors.extraWhite,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 3,
                                  color: AppColors.lightGrey,
                                  offset: const Offset(0, 4)),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 14, right: 14, top: 10, bottom: 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Susan Thapa",
                                      style: CustomTextStyles.f14W600()),
                                  Text("Rs.700",
                                      style: CustomTextStyles.f14W600(
                                          color: AppColors.primaryColor)),
                                ],
                              ),
                              const SizedBox(height: 3),
                              Text(
                                  "Specializes in the care of pets like dogs and cats.",
                                  style: CustomTextStyles.f12W400(
                                      color: AppColors.lGrey)),
                              const SizedBox(height: 4),
                              const StarWidget(),
                            ],
                          ),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 18, right: 18, top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: Get.width / 2.3,
                child: CustomElevatedButton(title: "Call Now", onTap: () {}),
              ),
              SizedBox(
                width: Get.width / 2.3,
                child: CustomElevatedButton(
                    title: "Book Now",
                    onTap: () {
                      Get.to(() => AppointmentBookingScreen());
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
