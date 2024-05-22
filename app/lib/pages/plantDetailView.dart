import 'package:flutter/material.dart';
import 'package:app/widgets/plantList.dart'; // Ensure the correct path is used here

class PlantDetail extends StatelessWidget {
  final PlantView plant;

  const PlantDetail({Key? key, required this.plant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(plant.species),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(plant.imageUrl),
            SizedBox(height: 20),
            Text(
              'Species: ${plant.species}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Condition: ${plant.condition}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Date: ${plant.date.toLocal()}'.split(' ')[0],
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
