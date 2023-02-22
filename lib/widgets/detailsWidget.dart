import 'package:flutter/material.dart';
import 'package:weather_app/widgets/forecastDayWidget.dart';

class DetailsWidget extends StatelessWidget {
  final List forecastData;
  final String units;
  const DetailsWidget(
      {Key? key, required this.forecastData, required this.units})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: forecastData.isNotEmpty
          ? Wrap(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ForecastDayWidget(
                      dayData: forecastData[0],
                      units: units,
                    ),
                    ForecastDayWidget(
                      dayData: forecastData[1],
                      units: units,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ForecastDayWidget(
                      dayData: forecastData[2],
                      units: units,
                    ),
                    ForecastDayWidget(
                      dayData: forecastData[3],
                      units: units,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ForecastDayWidget(
                      dayData: forecastData[4],
                      units: units,
                    ),
                  ],
                )
              ],
            )
          : const CircularProgressIndicator(
              color: Color(0xFF3C47E9),
            ),
    );
  }
}
