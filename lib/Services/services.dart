import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Model/weather_model.dart';

class WeatherServices {
  static Future<WeatherData> fetchWeather(String lat, String lon) async {
    const String apiKey = "54eeeb7bb4500782bf24c70fa134e498";
    final String url =
        "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey";
    try {
      final http.Response response = await http.get(
        Uri.parse(url),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        return WeatherData.fromJson(json);
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      throw Exception('Error fetching weather data');
    }
  }
}
