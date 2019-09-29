// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actions.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $AddHolidaysAction {
  Iterable<NationalHoliday> get holidays;
  const $AddHolidaysAction();
  AddHolidaysAction copyWith({Iterable<NationalHoliday> holidays}) =>
      AddHolidaysAction(holidays: holidays ?? this.holidays);
  String toString() => "AddHolidaysAction(holidays: $holidays)";
  bool operator ==(dynamic other) =>
      other.runtimeType == runtimeType &&
      const DeepCollectionEquality().equals(holidays, other.holidays);
  @override
  int get hashCode {
    var result = 17;
    result = 37 * result + const DeepCollectionEquality().hash(holidays);
    return result;
  }
}

class AddHolidaysAction$ {
  static final holidays = Lens<AddHolidaysAction, Iterable<NationalHoliday>>(
      (s_) => s_.holidays, (s_, holidays) => s_.copyWith(holidays: holidays));
}

abstract class $DbHolidaysRetrievedAction {
  Iterable<NationalHoliday> get holidays;
  const $DbHolidaysRetrievedAction();
  DbHolidaysRetrievedAction copyWith({Iterable<NationalHoliday> holidays}) =>
      DbHolidaysRetrievedAction(holidays: holidays ?? this.holidays);
  String toString() => "DbHolidaysRetrievedAction(holidays: $holidays)";
  bool operator ==(dynamic other) =>
      other.runtimeType == runtimeType &&
      const DeepCollectionEquality().equals(holidays, other.holidays);
  @override
  int get hashCode {
    var result = 17;
    result = 37 * result + const DeepCollectionEquality().hash(holidays);
    return result;
  }
}

class DbHolidaysRetrievedAction$ {
  static final holidays =
      Lens<DbHolidaysRetrievedAction, Iterable<NationalHoliday>>(
          (s_) => s_.holidays,
          (s_, holidays) => s_.copyWith(holidays: holidays));
}

abstract class $DbInsertHolidaysAction {
  Iterable<NationalHoliday> get holidays;
  const $DbInsertHolidaysAction();
  DbInsertHolidaysAction copyWith({Iterable<NationalHoliday> holidays}) =>
      DbInsertHolidaysAction(holidays: holidays ?? this.holidays);
  String toString() => "DbInsertHolidaysAction(holidays: $holidays)";
  bool operator ==(dynamic other) =>
      other.runtimeType == runtimeType &&
      const DeepCollectionEquality().equals(holidays, other.holidays);
  @override
  int get hashCode {
    var result = 17;
    result = 37 * result + const DeepCollectionEquality().hash(holidays);
    return result;
  }
}

class DbInsertHolidaysAction$ {
  static final holidays =
      Lens<DbInsertHolidaysAction, Iterable<NationalHoliday>>(
          (s_) => s_.holidays,
          (s_, holidays) => s_.copyWith(holidays: holidays));
}

abstract class $ApiFetchHolidaysSuccessAction {
  Iterable<NationalHoliday> get holidays;
  const $ApiFetchHolidaysSuccessAction();
  ApiFetchHolidaysSuccessAction copyWith(
          {Iterable<NationalHoliday> holidays}) =>
      ApiFetchHolidaysSuccessAction(holidays: holidays ?? this.holidays);
  String toString() => "ApiFetchHolidaysSuccessAction(holidays: $holidays)";
  bool operator ==(dynamic other) =>
      other.runtimeType == runtimeType &&
      const DeepCollectionEquality().equals(holidays, other.holidays);
  @override
  int get hashCode {
    var result = 17;
    result = 37 * result + const DeepCollectionEquality().hash(holidays);
    return result;
  }
}

class ApiFetchHolidaysSuccessAction$ {
  static final holidays =
      Lens<ApiFetchHolidaysSuccessAction, Iterable<NationalHoliday>>(
          (s_) => s_.holidays,
          (s_, holidays) => s_.copyWith(holidays: holidays));
}
