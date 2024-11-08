import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Model/weather_model.dart';

class WeatherServices {
  Future<WeatherData> fetchWeather(String lat, String lon) async {
    try {
      final response = await http.get(
        Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=54eeeb7bb4500782bf24c70fa134e498",
        ),
      );

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return WeatherData.fromJson(json);
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      print('Error: ${e.toString()}');
      throw Exception('Error fetching weather data');
    }
  }
}
