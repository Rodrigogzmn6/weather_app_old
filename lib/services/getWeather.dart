import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Map> fetchLocalWeather(latitude, longitude, units) async {
  final response = await http
      .get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=d1006ab6bd1d9b78629d448b5858a92f&units=$units'))
      .timeout(const Duration(seconds: 30));
  return response.statusCode == 200
      ? jsonDecode(response.body)
      : throw Exception('Failed to load');
}

Future<Map> fetchLocalForecast(latitude, longitude, units) async {
  final response = await http
      .get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid=d1006ab6bd1d9b78629d448b5858a92f&units=$units'))
      .timeout(const Duration(seconds: 30));

  return response.statusCode == 200
      ? jsonDecode(response.body)
      : throw Exception('Failed to load');
}

Future<Map> fetchCityWeather(city, units) async {
  final response = await http
      .get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=d1006ab6bd1d9b78629d448b5858a92f&units=$units'))
      .timeout(const Duration(seconds: 30));

  return response.statusCode == 200
      ? jsonDecode(response.body)
      : throw Exception('Failed to load');
}

Future<Map> fetchCityForecast(city, units) async {
  final response = await http
      .get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=d1006ab6bd1d9b78629d448b5858a92f&units=$units'))
      .timeout(const Duration(seconds: 30));

  return response.statusCode == 200
      ? jsonDecode(response.body)
      : throw Exception('Failed to load');
}
