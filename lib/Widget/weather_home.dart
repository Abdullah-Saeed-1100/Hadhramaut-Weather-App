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
            color: Colors.yellow,
            fontWeight: FontWeight.bold,
          ),
        ),
        // for current temperature of my location
        Text(
          "${weather.temperature.current.toStringAsFixed(2)}°C",
          style: const TextStyle(
            fontSize: 40,
            color: Colors.yellow,
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
        const SizedBox(height: 7),
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
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 31, 87, 133),
                  Color.fromARGB(255, 68, 149, 216),
                  Color.fromARGB(255, 31, 87, 133),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                // stops: [
                //   0.30,
                //   0.30,
                //   0.10,
                // ],
              )),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    weatherInfoCard(
                        title: "Wind",
                        value: "${weather.wind.speed}km/h",
                        icon: Icons.wind_power),
                    weatherInfoCard(
                        title: "Max",
                        value: "${weather.maxTemperature.toStringAsFixed(2)}°C",
                        icon: Icons.sunny),
                    weatherInfoCard(
                        title: "Min",
                        value: "${weather.minTemperature.toStringAsFixed(2)}°C",
                        icon: Icons.wind_power),
                  ],
                ),
                const Divider(height: 2, color: Colors.white54),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    weatherInfoCard(
                        title: "Humidity",
                        value: "${weather.humidity}%",
                        icon: Icons.water_drop),
                    weatherInfoCard(
                        title: "Pressure",
                        value: "${weather.pressure}hPa",
                        icon: Icons.air),
                    weatherInfoCard(
                        title: "Sea-Level",
                        value: "${weather.seaLevel}m",
                        icon: Icons.leaderboard),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Column weatherInfoCard(
      {required String title, required String value, required IconData icon}) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(
            color: Colors.yellow,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        )
      ],
    );
  }
}
