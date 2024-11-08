import 'package:flutter/material.dart';

import '../Model/weather_model.dart';
import '../Services/services.dart';

class DataProvider extends ChangeNotifier {
  // defult Mukalla
  String _lat = "14.54248";
  String _lon = "49.12424";
  int _index = 0;

  int get indexSelected => _index;

  Future<WeatherData> get getData async {
    WeatherData data = await WeatherServices.fetchWeather(_lat, _lon);
    return data;
  }

  void selectCity(String lat, String lon, int indexSelected) {
    _index = indexSelected;
    _lat = lat;
    _lon = lon;
    notifyListeners();
  }
}
