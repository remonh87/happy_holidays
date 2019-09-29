import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:functional_data/functional_data.dart';
import 'package:happy_holidays/model/national_holiday.dart';

part 'actions.g.dart';

//ignore_for_file: annotate_overrides
class StartAppAction {}

@FunctionalData()
class AddHolidaysAction extends $AddHolidaysAction {
  const AddHolidaysAction({@required this.holidays});

  @CustomEquality(DeepCollectionEquality())
  final Iterable<NationalHoliday> holidays;
}

@FunctionalData()
class DbInsertHolidaysAction extends $AddHolidaysAction {
  const DbInsertHolidaysAction({@required this.holidays});

  @CustomEquality(DeepCollectionEquality())
  final Iterable<NationalHoliday> holidays;
}
