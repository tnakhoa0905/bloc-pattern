import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/weather_model.dart';

class WeatherApiProvider {
  Client client = Client();
  final _apiKey = 'e754ee82ac62c08e8899a0a944f431da';

  Future<ItemWeather> fetchWeather() async {
    print("entered");
    //Nhận dữ liệu từ API sever
    final response = await client.get(
        "https://api.openweathermap.org/data/2.5/weather?lat=15.90306&lon=105.80669&appid=$_apiKey");
    // print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      // Cụ thể ở đây sẽ phân tích dữ liệu từ response thành dữ liệu mảng
      return ItemWeather.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
