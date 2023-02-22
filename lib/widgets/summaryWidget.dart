import 'package:flutter/material.dart';

class SummaryWidget extends StatelessWidget {
  final Map weatherData;
  final Function handleSearchButton, handleLocationButton;
  final String units;
  const SummaryWidget(
      {Key? key,
      required this.weatherData,
      required this.handleSearchButton,
      required this.handleLocationButton,
      required this.units})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  child: Text(
                    'Search for places',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: const Color(0xFF3C47E9),
                  child: IconButton(
                    color: const Color(0xFFE7E7EB),
                    onPressed: () => handleLocationButton(),
                    icon: const Icon(
                      Icons.my_location,
                      size: 22.0,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 24.0),
            weatherData.isNotEmpty
                ? Column(
                    children: <Widget>[
                      Image.network(
                        'http://openweathermap.org/img/wn/${weatherData['icon']}@2x.png',
                        scale: 0.75,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return const CircularProgressIndicator(
                            color: Color(0xFF3C47E9),
                          );
                        },
                      ),
                      const SizedBox(height: 24.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '${weatherData['temperature']}',
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          Text(
                            units == 'metric' ? '℃' : '℉',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ],
                      ),
                      const SizedBox(height: 18.0),
                      Text(
                        weatherData['description'],
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(height: 18.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Today  -  ',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text(
                            weatherData['date'],
                            style: Theme.of(context).textTheme.titleSmall,
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
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 36.0),
                    ],
                  )
                : const CircularProgressIndicator(
                    color: Color(0xFF3C47E9),
                  ),
          ],
        ),
      ),
    );
  }
}
