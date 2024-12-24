import 'dart:developer';

String formatTime2(String? timeString) {
  try {
    if (timeString == null) return "";
    DateTime dateTime = DateTime.parse(timeString);
    int hour = dateTime.hour;
    int minute = dateTime.minute;
    String period = hour < 12 ? "am" : "pm";

    // Handle 12-hour format for clarity
    if (hour > 12) {
      hour -= 12; // Convert to 12-hour format
    } else if (hour == 0) {
      hour = 12; // Midnight edge case
    }

    // Format the hour and minute with leading zeros if necessary
    String formattedHour = hour.toString().padLeft(2, '0');
    String formattedMinute = minute.toString().padLeft(2, '0');

    return "$formattedHour:$formattedMinute $period";
  } catch (e) {
    log("error from formatTime2 function: $e");
    return "";
  }
}
