import 'package:flutter/cupertino.dart';
import 'package:happy_holidays/api/holiday_api_client.dart';
import 'package:happy_holidays/redux/actions.dart';
import 'package:happy_holidays/redux/app_state.dart';
import 'package:redux/redux.dart';

class AppMiddleware implements MiddlewareClass<AppState> {
  const AppMiddleware({@required HolidayApiClient apiClient})
      : _apiClient = apiClient;

  final HolidayApiClient _apiClient;

  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
    if (action is StartAppAction) {
      _retrieveHolidays(store.dispatch);
    }
    next(action);
  }

  Future<void> _retrieveHolidays(void Function(dynamic action) dispatch) async {
    final result = await _apiClient.nextPublicHolidaysWorldwide();
    dispatch(AddHolidaysAction(holidays: result));
  }
}
