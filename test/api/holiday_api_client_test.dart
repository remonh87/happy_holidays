import 'package:flutter_test/flutter_test.dart';
import 'package:happy_holidays/api/holiday_api.dart';
import 'package:happy_holidays/api/holiday_api_client.dart';
import 'package:happy_holidays/model/national_holiday.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

class MockApi extends Mock implements HolidayApi {}

void main() {
  group('$HolidayApiClient', () {
    MockApi mockApi;
    HolidayApiClient sut;

    setUp(() {
      mockApi = MockApi();
      sut = HolidayApiClient(holidayApi: mockApi);
    });

    group('GIVEN api returns succesful response', () {
      test('It converts json body into list of national holidays', () async {
        final successfulResponse = http.Response(
            '[{"date": "2019-09-10", "localName": "test holiday local", "name": "test holiday"}]',
            200);
        when(mockApi.nextPublicHolidaysWorldwide())
            .thenAnswer((_) => Future<http.Response>.value(successfulResponse));

        expect(await sut.nextPublicHolidaysWorldwide(), <NationalHoliday>[
          NationalHoliday(
            name: 'test holiday',
            date: DateTime(2019, 9, 10),
          ),
        ]);
      });

      test('It creates empty list in case json body is empty', () async {
        final successfulResponse = http.Response('[{}]', 200);
        when(mockApi.nextPublicHolidaysWorldwide())
            .thenAnswer((_) => Future<http.Response>.value(successfulResponse));

        expect(await sut.nextPublicHolidaysWorldwide(), <NationalHoliday>[]);
      });
    });

    group('GIVEN api returns unsucessful response', () {
      final successfulResponse = http.Response('error message', 400);

      setUp(() {
        when(mockApi.nextPublicHolidaysWorldwide())
            .thenAnswer((_) => Future<http.Response>.value(successfulResponse));
      });

      test('It throws error', () {
        expect(
            sut.nextPublicHolidaysWorldwide(),
            throwsA(equals(
                'Request failed: statuscode = 400 body = error message')));
      });
    });
  });
}
