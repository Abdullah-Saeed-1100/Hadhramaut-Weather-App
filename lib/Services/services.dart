import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Model/weather_model.dart';

class WeatherServices {
  fetchWeather() async {
    // Mukalla city and apy key for my account
    final response = await http.get(
      Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?lat=14.54248&lon=49.12424&appid=54eeeb7bb4500782bf24c70fa134e498"),
    );
    try {
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return WeatherData.fromJson(json);
      } else {
        throw Exception('Failed to load Weather data');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
