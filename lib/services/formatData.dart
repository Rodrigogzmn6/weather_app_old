import '../constants/days.dart';
import '../constants/months.dart';

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
  forecastData['list'].forEach((day) {
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

Map formattedHighlightsData(weatherData) {
  return {
    'wind': {
      'speed': weatherData['wind']['speed'].toString(),
      'degrees': weatherData['wind']['deg'].toDouble(),
    },
    'humidity': weatherData['main']['humidity'].toString(),
    'visibility': weatherData['visibility'].toString(),
    'pressure': weatherData['main']['pressure'].toString(),
  };
}

String formattedDate(date) {
  String weekday = days[date.weekday - 1].substring(0, 3),
      day = date.day.toString(),
      month = months[date.month - 1].substring(0, 3);
  return '$weekday $day $month';
}
