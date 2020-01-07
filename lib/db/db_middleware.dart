import 'package:happy_holidays/db/holiday_db.dart';
import 'package:happy_holidays/redux/actions.dart';
import 'package:happy_holidays/redux/app_state.dart';
import 'package:redux/redux.dart';

Middleware<AppState> dbMiddleware(HolidayDatabase db) =>
    (Store<AppState> store, dynamic action, NextDispatcher next) {
      executeAction(action, db, store.dispatch);
      next(action);
    };

Future<void> executeAction(dynamic action, HolidayDatabase db,
    void Function(dynamic action) dispatch) async {
  if (action is DbInsertHolidaysAction) {
    await db.addHolidays(action.holidays);
  } else if (action is DbRetrieveHolidaysAction) {
    final result = await db
        .retrieveHolidays(DateTime.now().subtract(const Duration(days: 1)));
    dispatch(DbHolidaysRetrievedAction(holidays: result));
  }
}
