import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:functional_data/functional_data.dart';
import 'package:happy_holidays/model/national_holiday.dart';

part 'app_state.g.dart';

//ignore_for_file: annotate_overrides

@FunctionalData()
class AppState extends $AppState {
  const AppState({@required this.nationalHolidays});

  @CustomEquality(DeepCollectionEquality())
  final Iterable<NationalHoliday> nationalHolidays;
}
