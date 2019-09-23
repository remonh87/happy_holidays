import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:happy_holidays/api/holiday_api.dart';
import 'package:happy_holidays/api/holiday_api_client.dart';
import 'package:happy_holidays/db/holiday_db.dart';
import 'package:happy_holidays/redux/actions.dart';
import 'package:happy_holidays/redux/app_state.dart';
import 'package:happy_holidays/redux/holiday_reducer.dart';
import 'package:happy_holidays/redux/middleware.dart';
import 'package:happy_holidays/ui/home_page.dart';
import 'package:redux/redux.dart';

import 'db/db_middleware.dart';

Future<void> main() async {
  const apiclient = HolidayApiClient(holidayApi: HolidayApi());
  final database = await HolidayDatabaseFactory().createDatabase();
  final store = Store<AppState>(
    holidayReducer,
    initialState: const AppState(nationalHolidays: []),
    middleware: [const AppMiddleware(apiClient: apiclient), dbMiddleware(HolidayDatabase(database))],
  );

  store.dispatch(StartAppAction());

  runApp(HolidayApp(
    store: store,
    apiClient: apiclient,
  ));
}

class HolidayApp extends StatelessWidget {
  const HolidayApp({
    @required this.store,
    @required this.apiClient,
    Key key,
  })  : assert(store != null),
        assert(apiClient != null),
        super(key: key);

  final Store<AppState> store;
  final HolidayApiClient apiClient;

  @override
  Widget build(BuildContext context) => StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomePage(
            title: 'National holiday',
            client: apiClient,
          ),
        ),
      );
}
