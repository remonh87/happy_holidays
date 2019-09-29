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

class DbRetrieveHolidaysAction {}

@FunctionalData()
class DbHolidaysRetrievedAction extends $DbHolidaysRetrievedAction {
  const DbHolidaysRetrievedAction({@required this.holidays});

  @CustomEquality(DeepCollectionEquality())
  final Iterable<NationalHoliday> holidays;
}

@FunctionalData()
class DbInsertHolidaysAction extends $DbInsertHolidaysAction {
  const DbInsertHolidaysAction({@required this.holidays});

  @CustomEquality(DeepCollectionEquality())
  final Iterable<NationalHoliday> holidays;
}

class ApiFetchHolidaysAction {}

@FunctionalData()
class ApiFetchHolidaysSuccessAction extends $ApiFetchHolidaysSuccessAction {
  const ApiFetchHolidaysSuccessAction({@required this.holidays});

  @CustomEquality(DeepCollectionEquality())
  final Iterable<NationalHoliday> holidays;
}
