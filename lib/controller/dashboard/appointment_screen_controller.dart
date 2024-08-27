import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class AppointmentScreenController extends GetxController{
  var selectedDay = DateTime.now().obs;
  var focusedDay = DateTime.now().obs;
  var calendarFormat = CalendarFormat.month.obs;

  void onDaySelected(DateTime selected, DateTime focused) {
    selectedDay.value = selected;
    focusedDay.value = focused;
  }

  void onFormatChanged(CalendarFormat format) {
    calendarFormat.value = format;
  }

  void onPageChanged(DateTime focused) {
    focusedDay.value = focused;
  }
  bool isPastDate(DateTime date) {
    final today = DateTime.now();
    return date.isBefore(DateTime(today.year, today.month, today.day));
  }

   var selectedTime = "".obs;  // To store the selected time, initialize with empty string or null

  void selectTime(String time) {
    selectedTime.value = time;
  }
}