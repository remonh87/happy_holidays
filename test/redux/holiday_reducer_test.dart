import 'package:flutter_test/flutter_test.dart';
import 'package:happy_holidays/model/national_holiday.dart';
import 'package:happy_holidays/redux/actions.dart';
import 'package:happy_holidays/redux/app_state.dart';
import 'package:happy_holidays/redux/holiday_reducer.dart';
import 'package:redux/redux.dart';

void main() {
  group('Given an empty appstate', () {
    Store<AppState> store;

    setUp(() {
      store = Store<AppState>(holidayReducer,
          initialState: const AppState(nationalHolidays: <NationalHoliday>[]));
    });

    test('It adds holidays to appstate when  $AddHolidaysAction is dispatched',
        () {
      const action = AddHolidaysAction(holidays: [
        NationalHoliday(name: 'Test holiday', date: '2019-10-20')
      ]);

      store.dispatch(action);
      expect(store.state.nationalHolidays,
          const [NationalHoliday(name: 'Test holiday', date: '2019-10-20')]);
    });

    test('It does not change state in case action is $StartAppAction', () {
      store.dispatch(StartAppAction());

      expect(
          store.state, const AppState(nationalHolidays: <NationalHoliday>[]));
    });
  });
}
