import 'package:flutter/material.dart';

class ForecastDayWidget extends StatelessWidget {
  final Map dayData;
  final String units;
  const ForecastDayWidget(
      {Key? key, required this.dayData, required this.units})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF1E213A),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 5),
        child: Column(
          children: <Widget>[
            Text(
              dayData['date'],
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Image.network(
              'http://openweathermap.org/img/wn/${dayData['icon']}@2x.png',
              scale: 0.75,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return const CircularProgressIndicator(
                  color: Color(0xFF3C47E9),
                );
              },
            ),
            Row(
              children: <Widget>[
                Text(
                  '${dayData['maxTemp']}${units == 'metric' ? '℃' : '℉'}',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  '${dayData['minTemp']}${units == 'metric' ? '℃' : '℉'}',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: const Color(0xFFA09FB1)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
