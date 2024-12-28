String formatTime(String isoTime) {
  // Parse the ISO 8601 string into a DateTime object
  DateTime dateTime = DateTime.parse(isoTime).toLocal();

  // Extract the hour and minute
  int hour = dateTime.hour;
  int minute = dateTime.minute;

  // Determine AM or PM
  String period = hour >= 12 ? 'PM' : 'AM';

  // Convert hour to 12-hour format
  hour = hour % 12;
  hour = hour == 0 ? 12 : hour;

  // Format the time as 10:30 PM
  String formattedTime =
      '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $period';

  return formattedTime;
}
