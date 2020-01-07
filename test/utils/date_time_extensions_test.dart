import 'package:flutter_test/flutter_test.dart';
import 'package:happy_holidays/utils/date_time_extensions.dart';

void main() {
  final dateTime = DateTime(2020, 1, 1);

  test('European dateformat', () {
    expect(dateTime.simpleDateTimeEuropean(), '1-1-2020');
  });

  test('US dateformat', () {
    expect(dateTime.simpleDateTimeUS(), '2020-1-1');
  });
}
