class ItemWeather {
  late _Coord _coord;
  List<_Weather> _weather = [];
  ItemWeather.fromJson(Map<String, dynamic> parsedJson) {
    _coord = _Coord(parsedJson['coord']);
    print(_coord._lat);
    List<_Weather> temp = [];
    for (int i = 0; i < parsedJson['weather'].length; i++) {
      _Weather weather = _Weather(parsedJson['weather'][i]);
      temp.add(weather);
    }
    _weather = temp;
  }
  List<_Weather> get weather => _weather;
  _Coord get coord => _coord;
}

class _Coord {
  late double _lon;
  late double _lat;
  _Coord(dynamic coord) {
    _lon = coord['lon'];
    _lat = coord['lat'];
  }
  double get lon => _lon;
  double get lat => _lat;
}

class _Weather {
  late int _id;
  late String _main;
  late String _description;
  _Weather(dynamic weather) {
    _id = weather['id'];
    _main = weather['main'];
    _description = weather['description'];
  }
  int get id => _id;
  String get main => _main;
  String get description => _description;
}
