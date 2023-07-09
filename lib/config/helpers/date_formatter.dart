import 'package:intl/intl.dart';

/// class [DateFormatter]
class DateFormatter {
  // Static method to format a DateTime object into a specific date format
  static formatDate(DateTime date) {
    // Use the DateFormat class to format the date
    // In this case, the format is 'MMMM, dd, yyyy'
    String formattedDate = DateFormat('MMMM, dd, yyyy').format(date);

    return formattedDate; // Return the formatted date as a String
  }
}
