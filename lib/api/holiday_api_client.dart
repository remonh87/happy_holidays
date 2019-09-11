import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:happy_holidays/api/holiday_api.dart';
import 'package:happy_holidays/model/national_holiday.dart';

// ignore_for_file: avoid_as

class HolidayApiClient {
  const HolidayApiClient({@required HolidayApi holidayApi}) : _holidayApi = holidayApi;

  final HolidayApi _holidayApi;

  Future<Iterable<NationalHoliday>> nextPublicHolidaysWorldwide() async {
    return _holidayApi.nextPublicHolidaysWorldwide().then((r) {
      if (r.statusCode == 200) {
        return (jsonDecode(r.body) as Iterable<dynamic>).map((dynamic j) => NationalHoliday.fromJson(j));
      } else {
        return Future.error('Request failed: statuscode = ${r.statusCode} body = ${r.body}');
      }
    });
  }
}
