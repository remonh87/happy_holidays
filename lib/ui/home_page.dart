import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:happy_holidays/model/national_holiday.dart';
import 'package:happy_holidays/redux/app_state.dart';
import 'package:redux/redux.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StoreConnector<AppState, HomePageViewModel>(
              converter: HomePageViewModel.fromStore,
              builder: (context, viewModel) =>
                  Text(viewModel.holidays.isNotEmpty ? viewModel.holidays.first.name : 'Retrieving holidays'),
            ),
          ],
        ),
      ),
    );
  }
}

@visibleForTesting
class HomePageViewModel {
  const HomePageViewModel({@required this.holidays});

  final Iterable<NationalHoliday> holidays;

  static HomePageViewModel fromStore(Store<AppState> store) =>
      HomePageViewModel(holidays: store.state?.nationalHolidays ?? []);
}
