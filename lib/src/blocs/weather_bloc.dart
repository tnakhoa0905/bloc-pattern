import 'dart:async';

import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/weather_model.dart';

class WeatherBloc {
  final _repository = Repository();
  StreamController<ItemWeather> weatherFetcher =
      StreamController<ItemWeather>.broadcast();
  // thêm dữ liệu từ Repo vào ItemWeather và
  // lắng nghe luồng dữ liệu từ ItemWeather
  fetchWeather() async {
    ItemWeather itemModel = await _repository.fetchWeather();
    weatherFetcher.sink.add(itemModel);
  }

  dispose() {
    weatherFetcher.close();
  }
}
