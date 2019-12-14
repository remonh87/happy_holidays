import 'package:flutter_test/flutter_test.dart';
import 'package:happy_holidays/model/national_holiday.dart';
import 'package:happy_holidays/redux/actions.dart';
import 'package:happy_holidays/redux/app_middleware.dart';
import 'package:mockito/mockito.dart';

import '../utils/stubs.dart';

class _MockDispatcher extends Mock implements Dispatcher {}

void main() {
  group('$appMiddleWare', () {
    Future<void> Function(dynamic action) sut;
    _MockDispatcher dispatcher;

    setUp(() {
      dispatcher = _MockDispatcher();
      sut = (dynamic action) => executeAction(action, dispatcher.dispatch);
    });

    group('Given $StartAppAction is received', () {
      final action = StartAppAction();
      test('It dispatches $DbRetrieveHolidaysAction', () async {
        await sut(action);
        verify(dispatcher.dispatch(isInstanceOf<DbRetrieveHolidaysAction>()))
            .called(1);
      });
    });

    group('Given $DbHolidaysRetrievedAction is received', () {
      group('And action contains holidays', () {
        final holiday = NationalHoliday.testinstance();
        final action = DbHolidaysRetrievedAction(holidays: [holiday]);

        test('It dispatch $AddHolidaysAction', () async {
          await sut(action);
          verify(dispatcher.dispatch(AddHolidaysAction(holidays: [holiday])))
              .called(1);
        });
      });

      group('And no holidays are retrieved', () {
        const action = DbHolidaysRetrievedAction(holidays: []);
        test('It dispatch $ApiFetchHolidaysAction', () async {
          await sut(action);
          verify(dispatcher.dispatch(isInstanceOf<ApiFetchHolidaysAction>()))
              .called(1);
        });
      });
    });

    group('Given $ApiFetchHolidaysSuccessAction is received', () {
      final holiday = NationalHoliday.testinstance();
      final action = ApiFetchHolidaysSuccessAction(holidays: [holiday]);

      test('It dispatches $DbInsertHolidaysAction', () async {
        await sut(action);
        verify(dispatcher.dispatch(DbInsertHolidaysAction(holidays: [holiday])))
            .called(1);
      });

      test('It dispatches $DbRetrieveHolidaysAction()', () async {
        await sut(action);
        verify(dispatcher.dispatch(isInstanceOf<DbRetrieveHolidaysAction>()))
            .called(1);
      });
    });
  });
}
