import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:app/config/constants.dart';

import 'package:app/pages/plantPage.dart';
import 'package:app/pages/plantPage.dart';
import 'package:app/widgets/plant_view.dart';

class PlantDetail extends StatelessWidget {
  final PlantView plant;

  const PlantDetail({Key? key, required this.plant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateFormat _format = DateFormat.yMMMd();

    return Scaffold(
      appBar: AppBar(
        title: Text(plant.species),
      ),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kDefaultBorderRaduis),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(plant.imageUrl),
                ),
              ),
            ),
            SizedBox(height: kDefaultPadding),
            Text(
              'Species: ${plant.species}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: kDefaultPadding / 2),
            Text(
              'Condition: ${plant.condition}',
              style: TextStyle(
                fontSize: 16,
                color: plant.condition == 'Healthy' ? Colors.green : Colors.red,
              ),
            ),
            SizedBox(height: kDefaultPadding / 2),
            Text(
              'Date: ${_format.format(plant.date)}',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: kDefaultPadding),
            Text(
              'Description:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: kDefaultPadding / 2),
            Text(
              'Details about the plant condition and care instructions will be displayed here.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}



// class PlantView {
//   final String imageUrl;
//   final String species;
//   final String condition;
//   final DateTime date;

//   const PlantView({
//     required this.imageUrl,
//     required this.species,
//     required this.condition,
//     required this.date,
//   });
// }
