import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:app/config/constants.dart';

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(plant.imageUrl),
            SizedBox(height: 16),
            Text(
              'Giống loài: ${plant.species}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Tình trạng: ${plant.condition}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Ngày cập nhật: ${plant.date}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Miêu tả cây',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              plant.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Cách chữa trị ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              plant.treatment,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
