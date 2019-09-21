import 'package:happy_holidays/db/holiday_db.dart';
import 'package:happy_holidays/redux/actions.dart';
import 'package:happy_holidays/redux/app_state.dart';
import 'package:redux/redux.dart';

Middleware<AppState> dbMiddleware(HolidayDatabase db) => (Store<AppState> store, dynamic action, NextDispatcher next) {
      executeAction(db, action);
      next(action);
    };

Future<void> executeAction(dynamic action, HolidayDatabase db) async {
  if (action is AddHolidaysAction) {
    await db.addHolidays(action.holidays);
  }
}
