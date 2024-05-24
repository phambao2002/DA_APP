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
              'Giống loài: ${plant.species}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: kDefaultPadding / 2),
            Text(
              'Tình trạng: ${plant.condition}',
              style: TextStyle(
                fontSize: 16,
                color: plant.condition == 'Bị bệnh' ? Colors.green : Colors.red,
              ),
            ),
            SizedBox(height: kDefaultPadding / 2),
            Text(
              'Ngày: ${_format.format(plant.date)}',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: kDefaultPadding),
            Text(
              'Sự miêu tả:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: kDefaultPadding / 2),
            Text(
              // Hiển thị miêu tả của cây từ trường description
              plant.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: kDefaultPadding),
            Text(
              'Cách chữa trị:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: kDefaultPadding / 2),
            Text(
              // Hiển thị thông tin về cách chữa trị từ trường treatment
              plant.treatment,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
