import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:happy_holidays/api/holiday_api.dart';
import 'package:happy_holidays/api/holiday_api_client.dart';
import 'package:happy_holidays/db/holiday_db.dart';
import 'package:happy_holidays/model/national_holiday.dart';
import 'package:happy_holidays/redux/actions.dart';
import 'package:happy_holidays/redux/app_middleware.dart';
import 'package:happy_holidays/redux/app_state.dart';
import 'package:happy_holidays/redux/holiday_reducer.dart';
import 'package:happy_holidays/api/api_middleware.dart';
import 'package:happy_holidays/ui/home_page.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';

import 'db/db_middleware.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final apiclient = HolidayApiClient(holidayApi: NagerHolidayApi());
  final database = await HolidayDatabaseFactory().createDatabase();
  final store = Store<AppState>(
    holidayReducer,
    initialState: const AppState(nationalHolidays: []),
    middleware: [ApiMiddleware(apiClient: apiclient), dbMiddleware(HolidayDatabase(database)), appMiddleWare()],
  );

  store.dispatch(StartAppAction());

  runApp(HolidayApp(
    store: store,
  ));
}

class HolidayApp extends StatelessWidget {
  const HolidayApp({
    @required this.store,
    Key key,
  })  : assert(store != null),
        super(key: key);

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          _providerFromStore<Iterable<NationalHoliday>>((state) => state.nationalHolidays),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomePage(
            title: 'National holiday',
          ),
        ),
      );

  StreamProvider<T> _providerFromStore<T>(T Function(AppState) convert) => StreamProvider<T>(
        create: (_) => store.onChange.map(convert).distinct(const DeepCollectionEquality().equals),
        initialData: convert(store.state),
      );
}
