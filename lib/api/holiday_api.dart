import 'package:http/http.dart' as http;

class HolidayApi {
  static const String _baseUrl = 'https://date.nager.at/api/v2';

  Future<http.Response> nextPublicHolidaysWorldwide() async => http.get('$_baseUrl/NextPublicHolidaysWorldwide');
}
