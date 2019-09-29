import 'package:http/http.dart' as http;

abstract class HolidayApi {
  Future<http.Response> nextPublicHolidaysWorldwide();
}

class NagerHolidayApi extends HolidayApi {
  NagerHolidayApi() : super();

  static const String _baseUrl = 'https://date.nager.at/api/v2';

  @override
  Future<http.Response> nextPublicHolidaysWorldwide() async => http.get('$_baseUrl/NextPublicHolidaysWorldwide');
}
