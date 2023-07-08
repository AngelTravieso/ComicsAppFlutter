import 'package:intl/intl.dart';

class DateFormatter {
  static formatDate(DateTime date) {
    String formattedDate = DateFormat('MMMM, dd, yyyy').format(date);

    return formattedDate;
  }
}
