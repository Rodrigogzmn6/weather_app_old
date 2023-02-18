import 'package:flutter/material.dart';

class ForecastDayWidget extends StatelessWidget {
  final Map dayData;
  const ForecastDayWidget({Key? key, required this.dayData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF1E213A),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        child: Column(
          children: <Widget>[
            Text(
              dayData['date'],
              style: const TextStyle(
                color: Color(0xFFE7E7EB),
              ),
            ),
            Image.network(
              'http://openweathermap.org/img/wn/${dayData['icon']}@2x.png',
              scale: 0.75,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  dayData['minTemp'],
                  style: const TextStyle(
                    color: Color(0xFFE7E7EB),
                  ),
                ),
                SizedBox(
                  width: 24,
                ),
                Text(
                  dayData['maxTemp'],
                  style: const TextStyle(
                    color: Color(0xFFA09FB1),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
