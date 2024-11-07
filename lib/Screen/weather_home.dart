import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../Model/weather_model.dart';
import '../Provider/get_data_provider.dart';
import '../Widget/menu.dart';
import '../Widget/weather_home.dart';

class WeatherHome extends StatelessWidget {
  const WeatherHome({super.key});

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('EEEE d, MMMM yyyy').format(DateTime.now());
    String formattedTime = DateFormat('hh:mm a').format(DateTime.now());

    return Scaffold(
      backgroundColor: const Color(0xFF676BD0),
      drawer: const MenuDashboard(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: FutureBuilder<WeatherData>(
            future: Provider.of<DataProvider>(context).getData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Display loading indicator while waiting for data
                return Center(
                    child: Container(
                  padding: const EdgeInsets.all(40),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: const CircularProgressIndicator(
                    color: Colors.yellow,
                  ),
                ));
              } else if (snapshot.hasError) {
                // Display error message if there was an error
                return Center(
                  child: Text(
                    'Error loading weather data: ${snapshot.error}',
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              } else if (snapshot.hasData) {
                // Display weather details if data is loaded
                WeatherData weatherInfo = snapshot.data!;
                return WeatherDetail(
                  weather: weatherInfo,
                  formattedDate: formattedDate,
                  formattedTime: formattedTime,
                );
              } else {
                // Display message if no data is available
                return const Center(
                  child: Text('No data available',
                      style: TextStyle(color: Colors.white)),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
