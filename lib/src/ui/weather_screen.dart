// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import '../blocs/weather_bloc.dart';

class Weather extends StatelessWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherBloc st = WeatherBloc();
    st.fetchWeather();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Weather'),
      ),
      body: StreamBuilder<ItemWeather>(
        //lắng nghe sự có mặt của luồng dữ liệu weather
        stream: st.weatherFetcher.stream,
        builder: (context, AsyncSnapshot<ItemWeather> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot.data!);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(ItemWeather data) {
    return Padding(
      padding: const EdgeInsets.only(left: 100, right: 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
              height: 200,
              margin: const EdgeInsets.only(top: 4),
              decoration:
                  const BoxDecoration(color: Color.fromARGB(248, 90, 51, 233)),
              child: Center(child: Text(data.weather[0].main))),
          Container(
              margin: const EdgeInsets.only(top: 4),
              height: 200,
              decoration:
                  const BoxDecoration(color: Color.fromARGB(248, 44, 123, 214)),
              child: Center(child: Text(data.weather[0].description))),
          Container(
              margin: const EdgeInsets.only(top: 4),
              height: 200,
              decoration:
                  const BoxDecoration(color: Color.fromARGB(248, 221, 233, 51)),
              child: Center(child: Text("${data.coord.lat}"))),
          Container(
              margin: const EdgeInsets.only(top: 4),
              height: 200,
              decoration:
                  const BoxDecoration(color: Color.fromARGB(248, 233, 51, 142)),
              child: Center(child: Text("${data.coord.lon}"))),
        ],
      ),
    );
  }
}
