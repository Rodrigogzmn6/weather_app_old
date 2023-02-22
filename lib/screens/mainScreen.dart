import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/widgets/detailsWidget.dart';
import 'package:weather_app/widgets/highlightsWidget.dart';
import 'package:weather_app/widgets/searchWidget.dart';
import 'package:weather_app/widgets/unitsWidget.dart';

import '../services/formatData.dart';
import '../services/getLocation.dart';
import '../services/getWeather.dart';
import '../widgets/summaryWidget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _searching = false;
  TextEditingController searchController = TextEditingController();
  Map weatherData = {};
  Map forecastData = {};
  String units = 'metric';

  @override
  void initState() {
    getLocalWeather();
    getLocalForecast();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void getLocalWeather() async {
    Position location = await getLocation();
    Map data = await fetchLocalWeather(
        location.latitude.toString(), location.longitude.toString(), units);
    setState(() {
      weatherData = data;
    });
  }

  void getLocalForecast() async {
    Position location = await getLocation();
    Map data = await fetchLocalForecast(
        location.latitude.toString(), location.longitude.toString(), units);
    setState(() {
      forecastData = data;
    });
  }

  void getSearchWeather(city) async {
    Map data = await fetchCityWeather(city, units);
    setState(() {
      weatherData = data;
    });
  }

  void getSearchForecast(city) async {
    Map data = await fetchCityForecast(city, units);
    setState(() {
      forecastData = data;
    });
  }

  void handleCloseButton() {
    setState(() {
      _searching = false;
    });
  }

  void handleSearchButton() {
    setState(() {
      _searching = true;
    });
  }

  void handleLocationButton() {
    setState(() {
      weatherData = {};
      forecastData = {};
    });
    getLocalWeather();
    getLocalForecast();
  }

  void handleSearchCityButton(city) {
    setState(() {
      weatherData = {};
      forecastData = {};
    });
    handleCloseButton();
    searchController.clear();
    getSearchWeather(city);
    getSearchForecast(city);
  }

  void handleUnitChange(unit) async {
    List coords = [weatherData['coord']['lat'], weatherData['coord']['lon']];
    if (weatherData.isNotEmpty && forecastData.isNotEmpty) {
      setState(() {
        weatherData = {};
        forecastData = {};
        units = unit;
      });
      Map weather = await fetchLocalWeather(
          coords[0].toString(), coords[1].toString(), units);
      Map forecast = await fetchLocalForecast(
          coords[0].toString(), coords[1].toString(), units);
      setState(() {
        weatherData = weather;
        forecastData = forecast;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF100E1D),
        body: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _searching
                  ? SearchWidget(
                      handleClose: handleCloseButton,
                      handleSearch: handleSearchCityButton,
                      searchController: searchController,
                    )
                  : Column(
                      children: [
                        SummaryWidget(
                          weatherData: weatherData.isNotEmpty
                              ? formattedSummaryWeatherData(weatherData)
                              : weatherData,
                          handleSearchButton: handleSearchButton,
                          handleLocationButton: handleLocationButton,
                          units: units,
                        ),
                        Container(
                          color: const Color(0xFF100E1D),
                          child: Column(
                            children: [
                              UnitsWidget(
                                unit: units,
                                handleUnit: handleUnitChange,
                              ),
                              DetailsWidget(
                                forecastData: forecastData.isNotEmpty
                                    ? formattedForecastWeatherData(forecastData)
                                    : [],
                                units: units,
                              ),
                              HighlightsWidget(
                                highlightsData: weatherData.isNotEmpty
                                    ? formattedHighlightsData(weatherData)
                                    : weatherData,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ]),
      ),
    );
  }
}
