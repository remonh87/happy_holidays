import 'package:flutter/material.dart';
import 'package:happy_holidays/api/holiday_api.dart';
import 'package:happy_holidays/api/holiday_api_client.dart';
import 'package:happy_holidays/model/national_holiday.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        title: 'National holiday',
        client: HolidayApiClient(holidayApi: HolidayApi()),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key, @required this.title, @required this.client})
      : super(key: key);
  final String title;
  final HolidayApiClient client;

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
            FutureBuilder<Iterable<NationalHoliday>>(
              future: client.nextPublicHolidaysWorldwide(),
              builder: (context, snapshot) =>
                  Text(snapshot?.data?.first?.name ?? 'Calling api...'),
            ),
          ],
        ),
      ),
    );
  }
}
