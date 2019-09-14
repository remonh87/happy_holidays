import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:happy_holidays/api/holiday_api.dart';
import 'package:happy_holidays/api/holiday_api_client.dart';
import 'package:happy_holidays/redux/actions.dart';
import 'package:happy_holidays/redux/app_state.dart';
import 'package:happy_holidays/redux/holiday_reducer.dart';
import 'package:happy_holidays/redux/middleware.dart';
import 'package:happy_holidays/ui/home_page.dart';
import 'package:redux/redux.dart';

void main() {
  const apiclient = HolidayApiClient(holidayApi: HolidayApi());
  final store = Store<AppState>(
    holidayReducer,
    initialState: const AppState(nationalHolidays: []),
    middleware: [const AppMiddleware(apiClient: apiclient)],
  );

  store.dispatch(StartAppAction());

  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  const MyApp({@required this.store, Key key}) : super(key: key);

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) => StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomePage(
            title: 'National holiday',
            client: HolidayApiClient(holidayApi: HolidayApi()),
          ),
        ),
      );
}
