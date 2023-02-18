import 'package:flutter/material.dart';

class SummaryWidget extends StatelessWidget {
  final Map weatherData;
  final Function handleSearchButton, handleLocationButton;
  const SummaryWidget(
      {Key? key,
      required this.weatherData,
      required this.handleSearchButton,
      required this.handleLocationButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double width=MediaQuery.of(context).size.width;

    return Container(
      color: const Color(0xFF1E213A),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => handleSearchButton(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3C47E9),
                    foregroundColor: const Color(0xFFE7E7EB),
                  ),
                  child: const Text('Search for places'),
                ),
                CircleAvatar(
                  backgroundColor: const Color(0xFF3C47E9),
                  child: IconButton(
                    color: const Color(0xFFE7E7EB),
                    onPressed: () => handleLocationButton(),
                    icon: const Icon(Icons.my_location),
                  ),
                )
              ],
            ),
            const SizedBox(height: 24.0),
            Image.network(
              'http://openweathermap.org/img/wn/${weatherData['icon']}@2x.png',
              scale: 0.75,
            ),
            const SizedBox(height: 24.0),
            Text(
              '${weatherData['temperature']} ℃℉',
              style: const TextStyle(
                color: Color(0xFFE7E7EB),
                fontSize: 48.0,
              ),
            ),
            const SizedBox(height: 18.0),
            Text(
              weatherData['description'],
              style: const TextStyle(
                color: Color(0xFFA09FB1),
                fontSize: 36.0,
              ),
            ),
            const SizedBox(height: 18.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Today  -  ',
                  style: TextStyle(
                    color: Color(0xFFA09FB1),
                    fontSize: 18.0,
                  ),
                ),
                Text(
                  weatherData['date'],
                  style: const TextStyle(
                    color: Color(0xFFA09FB1),
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 9.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.location_on,
                  color: Color(0xFFA09FB1),
                  size: 18.0,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    weatherData['location'],
                    style: const TextStyle(
                      color: Color(0xFFA09FB1),
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 36.0),
          ],
        ),
      ),
    );
  }
}
