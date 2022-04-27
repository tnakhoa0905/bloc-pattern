import 'dart:async';
import 'package:weather_api/src/models/weather_model.dart';
import 'package:weather_api/src/resources/weather_api_provider.dart';

// thư mục đóng vai trò là kho lưu trữ dữ liệu từ api
class Repository {
  final weatherApiProvider = WeatherApiProvider();
  Future<ItemWeather> fetchWeather() => weatherApiProvider.fetchWeather();
}
