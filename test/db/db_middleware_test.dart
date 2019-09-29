import 'package:flutter_test/flutter_test.dart';
import 'package:happy_holidays/db/db_middleware.dart';
import 'package:happy_holidays/db/holiday_db.dart';
import 'package:happy_holidays/model/national_holiday.dart';
import 'package:happy_holidays/redux/actions.dart';
import 'package:mockito/mockito.dart';

import '../utils/stubs.dart';

class _MockDatabase extends Mock implements HolidayDatabase {}

class _MockDispatcher extends Mock implements Dispatcher {}

void main() {
  group('$dbMiddleware', () {
    Future<void> Function(dynamic action) sut;
    HolidayDatabase db;
    _MockDispatcher dispatcher;

    setUp(() {
      db = _MockDatabase();
      dispatcher = _MockDispatcher();
      sut = (dynamic action) => executeAction(action, db, dispatcher.dispatch);
    });

    test('It writes to database when $DbInsertHolidaysAction is dispatched', () async {
      final action = DbInsertHolidaysAction(holidays: [NationalHoliday.testinstance()]);
      await sut(action);
      verify(db.addHolidays(action.holidays)).called(1);
    });

    group('Given $DbRetrieveHolidaysAction is dispatched', () {
      const holiday = NationalHoliday(name: 'test', date: '2020-01-01');
      setUp(() async {
        when(db.retrieveHolidays()).thenAnswer((_) => Future.value([holiday]));
        final action = DbRetrieveHolidaysAction();
        await sut(action);
      });

      test('It fetches holidays from database', () async {
        verify(db.retrieveHolidays()).called(1);
      });

      test('It dispatches $DbHolidaysRetrievedAction when db contains results', () {
        verify(dispatcher.dispatch(const DbHolidaysRetrievedAction(holidays: [holiday]))).called(1);
      });
    });
  });
}
