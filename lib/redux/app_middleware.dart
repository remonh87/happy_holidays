import 'package:happy_holidays/redux/actions.dart';
import 'package:redux/redux.dart';

import 'app_state.dart';

Middleware<AppState> appMiddleWare() => (Store<AppState> store, dynamic action, NextDispatcher next) {
      executeAction(action, store.dispatch);
      next(action);
    };

Future<void> executeAction(dynamic action, void Function(dynamic action) dispatch) async {
  if (action is StartAppAction) {
    dispatch(DbRetrieveHolidaysAction());
  } else if (action is DbHolidaysRetrievedAction) {
    if (action.holidays.isNotEmpty) {
      dispatch(AddHolidaysAction(holidays: action.holidays));
    } else {
      dispatch(ApiFetchHolidaysAction());
    }
  } else if (action is ApiFetchHolidaysSuccessAction) {
    dispatch(DbInsertHolidaysAction(holidays: action.holidays));
    dispatch(DbRetrieveHolidaysAction());
  }
}
