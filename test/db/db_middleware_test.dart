import 'package:flutter_test/flutter_test.dart';
import 'package:happy_holidays/db/db_middleware.dart';
import 'package:happy_holidays/db/holiday_db.dart';
import 'package:happy_holidays/model/national_holiday.dart';
import 'package:happy_holidays/redux/actions.dart';
import 'package:mockito/mockito.dart';

class _MockDatabase extends Mock implements HolidayDatabase {}

void main() {
  group('$dbMiddleware', () {
    Future<void> Function(dynamic action) sut;
    HolidayDatabase db;

    setUp(() {
      db = _MockDatabase();
      sut = (dynamic action) => executeAction(action, db);
    });

    test('It writes to database when $AddHolidaysAction is dispatched', () async {
      final action = AddHolidaysAction(holidays: [NationalHoliday.testinstance()]);
      await sut(action);
      verify(db.addHolidays(action.holidays)).called(1);
    });
  });
}
