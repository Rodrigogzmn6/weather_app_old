import 'package:flutter/material.dart';

import '../constants/days.dart';
import '../constants/months.dart';
import '../constants/weather.dart';
import '../widgets/summaryWidget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _searching = false;

  void handleSearchButton() {
    // setState(() {
    //   _searching = true;
    // });
    print('Searching button clicked');
  }

  void handleLocationButton() {
    var date = DateTime.now();
    print('Location button clicked');
    print(date);
  }

  String formattedDate(date) {
    String weekday = days[date.weekday - 1].substring(0, 3),
        day = date.day.toString(),
        month = months[date.month - 1].substring(0, 3);
    return '$weekday $day $month';
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Map? weatherData = weather;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            _searching
                ? const Placeholder(
                    child: Text('Searching'),
                  )
                : SummaryWidget(
                    icon: weatherData['weather'][0]['icon'],
                    temp: weatherData['main']['temp'].round().toString(),
                    desc: weatherData['weather'][0]['main'],
                    date: formattedDate(DateTime.now()),
                    location: weatherData['name'],
                    handleSearchButoton: handleSearchButton,
                    handleLocationButton: handleLocationButton,
                  ),
            Expanded(
              child: Placeholder(
                fallbackWidth: width,
                fallbackHeight: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
// weather['weather']['icon']
