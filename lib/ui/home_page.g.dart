// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $HomePageViewModel {
  NationalHoliday get holiday;
  const $HomePageViewModel();
  HomePageViewModel copyWith({NationalHoliday holiday}) =>
      HomePageViewModel(holiday: holiday ?? this.holiday);
  String toString() => "HomePageViewModel(holiday: $holiday)";
  bool operator ==(dynamic other) =>
      other.runtimeType == runtimeType &&
      const DeepCollectionEquality.unordered().equals(holiday, other.holiday);
  @override
  int get hashCode {
    var result = 17;
    result =
        37 * result + const DeepCollectionEquality.unordered().hash(holiday);
    return result;
  }
}

class HomePageViewModel$ {
  static final holiday = Lens<HomePageViewModel, NationalHoliday>(
      (s_) => s_.holiday, (s_, holiday) => s_.copyWith(holiday: holiday));
}
