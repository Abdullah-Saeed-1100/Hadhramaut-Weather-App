import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../Model/weather_model.dart';
import '../Provider/get_data_provider.dart';
import '../Widget/circular_progress_indicator.dart';
import '../Widget/menu_widget.dart';
import '../Widget/weather_home.dart';

class WeatherHome extends StatelessWidget {
  const WeatherHome({super.key});

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('EEEE yyyy/M/d').format(DateTime.now());
    String formattedTime = DateFormat('hh:mm a').format(DateTime.now());

    return Scaffold(
      // backgroundColor: const Color(0xFF676BD0),
      drawer: const MenuDashboard(),
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF3B3DBF),
                Color.fromARGB(255, 135, 138, 226), // اللون الأول في التدرج
                Color.fromARGB(255, 133, 136, 211), // اللون الأول في التدرج
              ],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: FutureBuilder<WeatherData>(
                future: Provider.of<DataProvider>(context).getData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Display loading indicator while waiting for data
                    return const CircularProgressIndicatorWidget();
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
          )),
    );
  }
}
