import 'package:flutter/material.dart';

import '../constants/days.dart';
import '../constants/forecast.dart';
import '../constants/months.dart';
import '../constants/weather.dart';
import '../widgets/detailsWidget.dart';
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

  Map formattedSummaryWeatherData(weatherData) {
    return {
      'icon': weatherData['weather'][0]['icon'],
      'temperature': weatherData['main']['temp'].round().toString(),
      'description': weatherData['weather'][0]['main'],
      'date': formattedDate(DateTime.now()),
      'location': weatherData['name'],
    };
  }

  List<Map> formattedForecastWeatherData(forecastData) {
    List<Map> days = [];
    forecastData['list'].forEach((Map day) {
      if (DateTime.parse(day['dt_txt']).hour == 0) {
        Map dayData = {
          'date': formattedDate(DateTime.parse(day['dt_txt'])),
          'icon': day['weather'][0]['icon'],
          'maxTemp': day['main']['temp_max'].round().toString(),
          'minTemp': day['main']['temp_min'].round().toString(),
        };
        days.add(dayData);
      }
    });
    return days;
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
    Map? forecastData = forecast;

    return SafeArea(
      child: Scaffold(
        body: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _searching
                  ? const Placeholder(
                      child: Text('Searching'),
                    )
                  : SummaryWidget(
                      weatherData: formattedSummaryWeatherData(weatherData),
                      handleSearchButton: handleSearchButton,
                      handleLocationButton: handleLocationButton,
                    ),
              DetailsWidget(
                forecastData: formattedForecastWeatherData(forecastData),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
// weather['weather']['icon']
