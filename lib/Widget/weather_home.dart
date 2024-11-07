import 'package:flutter/material.dart';

import '../Model/weather_model.dart';

class WeatherDetail extends StatelessWidget {
  final WeatherData weather;
  final String formattedDate;
  final String formattedTime;
  const WeatherDetail({
    super.key,
    required this.weather,
    required this.formattedDate,
    required this.formattedTime,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // for current address name
        Text(
          weather.name,
          style: const TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        // for current temperature of my location
        Text(
          "${weather.temperature.current.toStringAsFixed(2)}°C",
          style: const TextStyle(
            fontSize: 40,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        // fpr weather condition
        if (weather.weather.isNotEmpty)
          Text(
            weather.weather[0].main,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        const SizedBox(height: 30),
        // for current date and time
        Text(
          formattedDate,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          formattedTime,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 30),
        Container(
          height: 200,
          width: 200,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/cloudy.png"),
            ),
          ),
        ),
        const SizedBox(height: 30),
        // for more weather detail
        Container(
          height: 250,
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.wind_power,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 5),
                        weatherInfoCard(
                            title: "Wind", value: "${weather.wind.speed}km/h"),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.sunny,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 5),
                        weatherInfoCard(
                            title: "Max",
                            value:
                                "${weather.maxTemperature.toStringAsFixed(2)}°C"),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.wind_power,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 5),
                        weatherInfoCard(
                            title: "Min",
                            value:
                                "${weather.minTemperature.toStringAsFixed(2)}°C"),
                      ],
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.water_drop,
                          color: Colors.amber,
                        ),
                        const SizedBox(height: 5),
                        weatherInfoCard(
                            title: "Humidity", value: "${weather.humidity}%"),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.air,
                          color: Colors.amber,
                        ),
                        const SizedBox(height: 5),
                        weatherInfoCard(
                            title: "Pressure", value: "${weather.pressure}hPa"),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.leaderboard,
                          color: Colors.amber,
                        ),
                        const SizedBox(height: 5),
                        weatherInfoCard(
                            title: "Sea-Level", value: "${weather.seaLevel}m"),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Column weatherInfoCard({required String title, required String value}) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        )
      ],
    );
  }
}
