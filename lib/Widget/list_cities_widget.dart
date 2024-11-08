import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Constant/hadhramaut_cities.dart';
import '../Model/city_model.dart';
import '../Provider/get_data_provider.dart';

class ListCitiesWidget extends StatelessWidget {
  const ListCitiesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      itemCount: HadhramautCities.cities.length,
      itemBuilder: (context, index) {
        final City city = HadhramautCities.cities[index];
        return Consumer<DataProvider>(builder: (context, dataProvider, child) {
          return InkWell(
            onTap: () {
              dataProvider.selectCity(city.latitude, city.longitude, index);
              Scaffold.of(context).closeDrawer();
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 2.5),
              decoration: BoxDecoration(
                border: dataProvider.indexSelected != index
                    ? null
                    : Border.all(width: 1, color: Colors.blue.shade200),
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
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        });
      },
    );
  }
}
