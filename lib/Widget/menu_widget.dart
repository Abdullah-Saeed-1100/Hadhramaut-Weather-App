import 'package:flutter/material.dart';
import 'list_cities_widget.dart';

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
          children: const [
            CloseBtn(),
            SizedBox(height: 50),
            ImageWeatherAndText(),
            SizedBox(height: 50),
            Expanded(
              child: ListCitiesWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageWeatherAndText extends StatelessWidget {
  const ImageWeatherAndText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              // color: Colors.black45,
              image: const DecorationImage(
                image: AssetImage("assets/cloudy.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 7),
          const Text(
            "Hadhramaut weather",
            style: TextStyle(fontSize: 22, color: Colors.yellow),
          ),
        ],
      ),
    );
  }
}

class CloseBtn extends StatelessWidget {
  const CloseBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(8),
      ),
      child: IconButton(
        onPressed: () {
          Scaffold.of(context).closeDrawer();
        },
        icon: const Icon(
          Icons.close,
          color: Colors.white,
        ),
      ),
    );
  }
}
