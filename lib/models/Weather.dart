class Weather {
  String? icon, units, main, location;
  int? humidity;
  double? temp, windSpeed, windDirection, visibility, pressure;
  final date = DateTime.now();

  Weather(this.icon, this.units, this.main, this.location, this.humidity, this.temp, this.windSpeed, this.windDirection, this.visibility, this.pressure);
}