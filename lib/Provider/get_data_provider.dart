import 'package:flutter/material.dart';

import '../Model/weather_model.dart';
import '../Services/services.dart';

class DataProvider extends ChangeNotifier {
  Future<WeatherData> getData() async {
    WeatherData data =
        await WeatherServices.fetchWeather("14.54248", "49.12424");
    return data;
  }
}
