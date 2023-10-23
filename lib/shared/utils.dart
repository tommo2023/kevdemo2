import 'package:intl/intl.dart';

/// Used format display of values in thousands
String formatNumberWithCommas(int number) {
  final formatter = NumberFormat('#,###');
  return formatter.format(number);
}
