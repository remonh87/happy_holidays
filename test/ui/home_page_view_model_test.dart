import 'package:flutter_test/flutter_test.dart';
import 'package:happy_holidays/model/national_holiday.dart';
import 'package:happy_holidays/ui/home_page.dart';

void main() {
  group('$HomePageViewModel', () {
    const holiday = NationalHoliday(name: 'a', date: '2019-01-01');

    test('It displays the holidays from appstate', () {
      final sut = HomePageViewModel.fromState([holiday]);

      expect(sut.holiday, holiday);
    });
  });
}
