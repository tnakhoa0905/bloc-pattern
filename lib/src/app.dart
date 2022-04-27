import 'package:flutter/material.dart';
import 'package:weather_api/src/ui/weather_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(theme: ThemeData.fallback(), home: const Weather());
  }
}
