import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:happy_holidays/api/holiday_api.dart';
import 'package:happy_holidays/api/holiday_api_client.dart';
import 'package:happy_holidays/db/db_middleware.dart';
import 'package:happy_holidays/db/holiday_db.dart';
import 'package:happy_holidays/main.dart';
import 'package:happy_holidays/redux/actions.dart';
import 'package:happy_holidays/redux/app_middleware.dart';
import 'package:happy_holidays/redux/app_state.dart';
import 'package:happy_holidays/redux/holiday_reducer.dart';
import 'package:happy_holidays/api/api_middleware.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:redux/redux.dart';
import 'package:sqflite/sqflite.dart';

class MockApi extends Mock implements HolidayApi {}

class MockDb extends Mock implements Database {}

void main() {
  group('Db integration test', () {
    HolidayApi api;
    Widget sut;
    MockDb db;

    group('GIVEN db contains holidays', () {
      setUp(() {
        api = MockApi();
        when(api.nextPublicHolidaysWorldwide()).thenAnswer((_) => Future.value(Response('[{}]', 200)));
        db = MockDb();
        when(db.insert(any, any)).thenAnswer((_) => Future.value(1));
        when(db.query('holidays')).thenAnswer(
          (_) => Future.value([
            <String, String>{'name': 'holiday from db', 'date': '2019-09-29T11:10:01.011Z'},
          ]),
        );
        sut = createSut(api, db);
      });

      testWidgets('Fetches holiday from db an display it on the screen', (WidgetTester tester) async {
        await tester.pumpWidget(sut);
        await tester.pump(const Duration(seconds: 4));

        final holidayFinder = find.text('holiday from db');
        expect(holidayFinder, findsOneWidget);
      });
    });
    group('Given api call returns holiday', () {
      setUp(() {
        const jsonBody = '[{"date": "2019-09-29T11:10:01.011Z", "localName": "testlocal", "name": "test"}]';
        api = MockApi();
        when(api.nextPublicHolidaysWorldwide()).thenAnswer((_) => Future.value(Response(jsonBody, 200)));
        db = MockDb();
        when(db.insert(any, any)).thenAnswer((_) => Future.value(1));
        when(db.query('holidays')).thenAnswer((_) => Future.value([<String, dynamic>{}]));
        sut = createSut(api, db);
      });

      testWidgets('Stores holiday in the db', (WidgetTester tester) async {
        await tester.pumpWidget(sut);

        verify(
          db.insert('holidays', <String, String>{'name': 'test', 'date': '2019-09-29T11:10:01.011Z'},
              nullColumnHack: anyNamed('nullColumnHack'), conflictAlgorithm: ConflictAlgorithm.replace),
        ).called(1);
      });
    });
  });
}

Widget createSut(HolidayApi api, Database database) {
  final store = Store<AppState>(
    holidayReducer,
    initialState: const AppState(nationalHolidays: []),
    middleware: [
      ApiMiddleware(apiClient: HolidayApiClient(holidayApi: api)),
      dbMiddleware(HolidayDatabase(database)),
      appMiddleWare(),
    ],
  );
  store.dispatch(StartAppAction());

  return HolidayApp(store: store);
}
