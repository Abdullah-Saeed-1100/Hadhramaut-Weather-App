import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/get_data_provider.dart';
import 'Screen/weather_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => DataProvider(),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: WeatherHome(),
        ));
  }
}
