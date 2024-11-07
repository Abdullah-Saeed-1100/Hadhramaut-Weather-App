import 'package:flutter/material.dart';
import 'package:hadhramaut_weather_app/Model/city_model.dart';
import 'package:provider/provider.dart';

import '../Constant/hadhramaut_cities.dart';
import '../Provider/get_data_provider.dart';

class MenuDashboard extends StatelessWidget {
  const MenuDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        height: height,
        width: width / 1.5,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          color: Colors.black54,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF676BD0),
                borderRadius: BorderRadius.circular(8),
              ),
              child: IconButton(
                onPressed: () {
                  Scaffold.of(context).closeEndDrawer();
                },
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xff6600A1),
                        image: const DecorationImage(
                          image: AssetImage("assets/cloudy.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Text(
                      "طقس حضرموت",
                      style: TextStyle(fontSize: 25, color: Colors.yellow),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 50),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                itemCount: HadhramautCities.cities.length,
                itemBuilder: (context, index) {
                  final City city = HadhramautCities.cities[index];
                  return Consumer<DataProvider>(
                      builder: (context, dataProvider, child) {
                    return InkWell(
                      onTap: () {
                        dataProvider.selectCity(
                            city.latitude, city.longitude, index);
                        Scaffold.of(context).closeDrawer();
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 2.5),
                        decoration: BoxDecoration(
                          border: dataProvider.indexSelected != index
                              ? null
                              : Border.all(
                                  width: 1, color: Colors.blue.shade200),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          leading: const Icon(
                            Icons.location_city_rounded,
                            color: Colors.white,
                          ),
                          title: Text(
                            city.nameEn,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    );
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
