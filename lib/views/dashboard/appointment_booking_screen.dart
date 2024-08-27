import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcure_user/controller/dashboard/appointment_screen_controller.dart';
import 'package:petcure_user/utils/colors.dart';
import 'package:petcure_user/utils/custom_text_style.dart';
import 'package:petcure_user/views/dashboard/summary_screen.dart';
import 'package:petcure_user/widgets/custom/elevated_button.dart';
import 'package:table_calendar/table_calendar.dart';

class AppointmentBookingScreen extends StatelessWidget {
  static String routeName = "/appointment-booking-screen";
  final c = Get.put(AppointmentScreenController());
  AppointmentBookingScreen({super.key});

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
        title: Text("Appointment",
            style: CustomTextStyles.f16W600(color: AppColors.textColor)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Select Date", style: CustomTextStyles.f16W600()),
              const SizedBox(height: 10),
              Obx(() => Container(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: const [
                        BoxShadow(
                          color: AppColors.borderColor,
                          blurRadius: 2.0,
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                    child: TableCalendar(
                      focusedDay: c.focusedDay.value,
                      firstDay: DateTime(2020),
                      lastDay: DateTime(2030),
                      calendarFormat: c.calendarFormat
                          .value, // Bind to controller's calendar format
                      startingDayOfWeek: StartingDayOfWeek.sunday,
                      selectedDayPredicate: (day) {
                        return isSameDay(c.selectedDay.value, day);
                      },
                      onDaySelected: c.onDaySelected,
                      onFormatChanged:
                          c.onFormatChanged, // Allow changing the format
                      onPageChanged: c.onPageChanged,
                      headerStyle: HeaderStyle(
                          formatButtonVisible: true,
                          titleCentered: true,
                          leftChevronIcon: const Icon(Icons.arrow_back,
                              color: AppColors.primaryColor),
                          rightChevronIcon: const Icon(Icons.arrow_forward,
                              color: AppColors.primaryColor),
                          titleTextStyle: CustomTextStyles.f18W600(
                              color: AppColors.primaryColor)),
                      calendarStyle: CalendarStyle(
                        selectedDecoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          shape: BoxShape.circle,
                        ),
                        todayDecoration: BoxDecoration(
                          border:
                              Border.all(color: Theme.of(context).primaryColor),
                          shape: BoxShape.circle,
                        ),
                        selectedTextStyle: CustomTextStyles.f14W400(
                            color: AppColors.extraWhite),
                        todayTextStyle: CustomTextStyles.f14W400(
                            color: AppColors.textColor),
                        defaultTextStyle: CustomTextStyles.f14W400(
                            color: AppColors.textColor),
                        disabledTextStyle:
                            CustomTextStyles.f14W400(color: AppColors.lGrey),
                        outsideTextStyle:
                            CustomTextStyles.f14W400(color: AppColors.lGrey),
                      ),
                      enabledDayPredicate: (day) {
                        return !c.isPastDate(day);
                      },
                      daysOfWeekStyle: DaysOfWeekStyle(
                        weekendStyle:
                            CustomTextStyles.f14W400(color: AppColors.rejected),
                      ),
                    ),
                  )),

              // Obx(() {
              //   return Container(
              //     padding: const EdgeInsets.all(8),
              //     decoration: BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.circular(12.0),
              //       boxShadow: const [
              //         BoxShadow(
              //           color: AppColors.borderColor,
              //           blurRadius: 2.0,
              //           offset: Offset(1, 1),
              //         ),
              //       ],
              //     ),
              //     child: TableCalendar(
              //       firstDay: DateTime.utc(2020, 1, 1),
              //       lastDay: DateTime.utc(2030, 12, 31),
              //       focusedDay: c.focusedDay.value,
              //       calendarFormat: c.calendarFormat.value,
              //       selectedDayPredicate: (day) {
              //         return isSameDay(c.selectedDay.value, day);
              //       },
              //       onDaySelected: (selectedDay, focusedDay) {
              //         if (selectedDay.isAfter(DateTime.now()) ||
              //             isSameDay(selectedDay, DateTime.now())) {
              //           c.onDaySelected(selectedDay, focusedDay);
              //         }
              //       },
              //       onFormatChanged: (format) {
              //         c.onFormatChanged(format);
              //       },
              //       onPageChanged: (focusedDay) {
              //         c.onPageChanged(focusedDay);
              //       },
              //       calendarStyle: CalendarStyle(
              //         todayTextStyle:
              //             CustomTextStyles.f14W400(color: AppColors.textColor),
              //         defaultTextStyle:
              //             CustomTextStyles.f14W400(color: AppColors.lGrey),
              //         weekendTextStyle:
              //             CustomTextStyles.f14W400(color: AppColors.lGrey),
              //         outsideTextStyle:
              //             CustomTextStyles.f14W400(color: AppColors.lGrey),
              //         todayDecoration: BoxDecoration(
              //           shape: BoxShape.circle,
              //           border: Border.all(color: Theme.of(context).primaryColor),
              //         ),
              //         selectedDecoration: BoxDecoration(
              //           color: Theme.of(context).primaryColor,
              //           shape: BoxShape.circle,
              //         ),
              //       ),
              //       headerStyle: HeaderStyle(
              //         titleTextStyle: TextStyle(
              //           color: Theme.of(context).primaryColor,
              //           fontSize: 18.0,
              //         ),
              //         formatButtonVisible: false, // Hide the format button
              //         leftChevronIcon: Icon(Icons.chevron_left,
              //             color: Theme.of(context).primaryColor),
              //         rightChevronIcon: Icon(Icons.chevron_right,
              //             color: Theme.of(context).primaryColor),
              //       ),
              //       daysOfWeekVisible: false, // Hide the days of the week row
              //       enabledDayPredicate: (day) {
              //         // Disable past dates
              //         return day.isAfter(DateTime.now()) ||
              //             isSameDay(day, DateTime.now());
              //       },
              //     ),
              //   );
              // }),
              const SizedBox(height: 25),

              Text("Select Date", style: CustomTextStyles.f16W600()),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TimeContainer(time: "8:00 AM", controller: c),
                  TimeContainer(time: "11:30 AM", controller: c),
                  TimeContainer(time: "3:00 PM", controller: c),
                ],
              ),
              const SizedBox(height: 25),

              Obx(() {
                return Text(
                  // ignore: unnecessary_null_comparison
                  'Selected Date: ${c.selectedDay.value != null ? '${c.selectedDay.value.day}/${c.selectedDay.value.month}/${c.selectedDay.value.year}' : 'None'}',
                  style: CustomTextStyles.f16W400(color: AppColors.textColor),
                );
              }),
              const SizedBox(height: 15),
              Obx(() {
                return Text(
                  'Selected Time: ${c.selectedTime.value}',
                  style: CustomTextStyles.f16W400(color: AppColors.textColor),
                );
              }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(left: 18, right: 18, top: 14, bottom: 14),
        child: CustomElevatedButton(
            title: "Continue",
            onTap: () {
              Get.to(() => SummaryScreen());
            }),
      ),
    );
  }
}

class TimeContainer extends StatelessWidget {
  final String time;
  final AppointmentScreenController controller;

  const TimeContainer(
      {super.key, required this.time, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isSelected = controller.selectedTime.value == time;

      return GestureDetector(
        onTap: () {
          controller.selectTime(time);
        },
        child: Container(
          height: 40,
          width: 105,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryColor : AppColors.extraWhite,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              width: 1,
              color: AppColors.primaryColor,
            ),
          ),
          child: Center(
            child: Text(
              time,
              style: CustomTextStyles.f14W400(
                color: isSelected ? AppColors.extraWhite : AppColors.textColor,
              ),
            ),
          ),
        ),
      );
    });
  }
}
