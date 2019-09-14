import 'package:flutter_test/flutter_test.dart';
import 'package:happy_holidays/model/national_holiday.dart';
import 'package:happy_holidays/redux/app_state.dart';
import 'package:happy_holidays/ui/home_page.dart';
import 'package:mockito/mockito.dart';
import 'package:redux/redux.dart';

class MockStore extends Mock implements Store<AppState> {}

void main() {
  group('$HomePageViewModel', () {
    HomePageViewModel viewModel;
    MockStore store;

    const holiday = NationalHoliday(name: 'a', date: '2019-01-01');

    setUp(() {
      store = MockStore();
      when(store.state).thenReturn(const AppState(nationalHolidays: [holiday]));
      viewModel = HomePageViewModel.fromStore(store);
    });

    test('It displays the holidays from appstate', () {
      expect(viewModel.holidays, [holiday]);
    });
  });
}
