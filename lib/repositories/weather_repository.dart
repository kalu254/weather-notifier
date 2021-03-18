import 'dart:async';

import 'package:meta/meta.dart';
import 'package:weather_notifier/models/models.dart';
import 'package:weather_notifier/repositories/repositories.dart';


class WeatherRepository {
  final WeatherApiClient weatherApiClient;

  WeatherRepository({@required this.weatherApiClient})
      : assert(weatherApiClient != null);

  Future<Weather> getWeather(String city) async {
    final int locationId = await weatherApiClient.getLocationId(city);
    return weatherApiClient.fetchWeather(locationId);
  }
}
