import 'package:flutter_test/flutter_test.dart';
import 'package:happy_holidays/api/holiday_api_client.dart';
import 'package:happy_holidays/model/national_holiday.dart';
import 'package:happy_holidays/redux/actions.dart';
import 'package:happy_holidays/redux/app_state.dart';
import 'package:happy_holidays/api/api_middleware.dart';
import 'package:mockito/mockito.dart';
import 'package:redux/redux.dart';

abstract class _Dispatcher {
  void call(dynamic action);
}

class _MockStore extends Mock implements Store<AppState> {}

class _MockDispatcher extends Mock implements _Dispatcher {}

class _MockApiClient extends Mock implements HolidayApiClient {}

void main() {
  group('$ApiMiddleware', () {
    group('GIVEN $StartAppAction is dispatched', () {
      _MockStore store;
      _MockDispatcher dispatcher;
      _MockApiClient apiClient;
      ApiMiddleware sut;

      final holidays = [const NationalHoliday(name: 'Test', date: '2019-10-01')];

      setUp(() {
        store = _MockStore();
        dispatcher = _MockDispatcher();
        apiClient = _MockApiClient();
        sut = ApiMiddleware(apiClient: apiClient);
        when(apiClient.nextPublicHolidaysWorldwide()).thenAnswer((_) => Future.value(holidays));
        sut.call(store, StartAppAction(), dispatcher);
      });

      test('It fetches holidays from api', () {
        verify(apiClient.nextPublicHolidaysWorldwide()).called(1);
      });

      test('It dispatches $DbInsertHolidaysAction', () {
        verify(store.dispatch(DbInsertHolidaysAction(holidays: holidays))).called(1);
      });
    });
  });
}