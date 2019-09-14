import 'package:happy_holidays/redux/actions.dart';
import 'package:happy_holidays/redux/app_state.dart';

AppState holidayReducer(AppState currentState, dynamic action) {
  if (action is AddHolidaysAction) {
    return currentState.copyWith(nationalHolidays: action.holidays);
  } else {
    return currentState;
  }
}
