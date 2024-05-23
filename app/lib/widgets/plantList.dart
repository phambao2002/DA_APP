import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:app/config/constants.dart';
import 'moreMenu.dart';
import 'package:app/widgets/plant_view.dart';
import 'package:app/widgets/PlantDetail.dart';
import 'package:app/pages/plantPage.dart';

class HistoryPlants extends StatefulWidget {
  const HistoryPlants({Key? key, required this.plantList}) : super(key: key);
  final List<PlantView> plantList;

  @override
  _HistoryPlantsState createState() => _HistoryPlantsState();
}

class _HistoryPlantsState extends State<HistoryPlants> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: widget.plantList.length,
      separatorBuilder: (context, index) => SizedBox(
        height: 15,
      ),
      itemBuilder: (context, index) {
        PlantView plantCard = widget.plantList[index];
        return ClipRRect(
          borderRadius: BorderRadius.circular(kDefaultBorderRaduis),
          child: Dismissible(
            background: removeWidget(),
            secondaryBackground: addWidget(),
            key: ValueKey(plantCard),
            child: PlantTile(
              plantCard: plantCard,
              onTap: () {
                _showPlantDetail(
                    plantCard); // Hiển thị thông tin chi tiết khi nhấn vào cây
              },
              packed: true,
            ),
            onDismissed: (DismissDirection direction) {
              setState(() {
                widget.plantList.removeAt(index);
              });
            },
          ),
        );
      },
    );
  }

  // Hàm hiển thị màn hình chi tiết cây
  void _showPlantDetail(PlantView plant) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlantDetail(plant: plant),
      ),
    );
  }

  // Widget xóa cây
  Widget removeWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
      alignment: Alignment.centerLeft,
      child: Text(
        'Remove',
        style: TextStyle(
          color: Theme.of(context).colorScheme.onError,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kDefaultBorderRaduis),
        color: Theme.of(context).colorScheme.error,
      ),
    );
  }

  // Widget thêm cây
  Widget addWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
      alignment: Alignment.centerRight,
      child: Text(
        'Add',
        style: TextStyle(
          color: Theme.of(context).colorScheme.onError,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kDefaultBorderRaduis),
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}

class MyPlants extends StatelessWidget {
  final List<PlantView> plantList;
  final Function(PlantView) onTap;

  const MyPlants({
    Key? key,
    required this.plantList,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: plantList.length,
      separatorBuilder: (context, index) => SizedBox(
        height: 15,
      ),
      itemBuilder: (context, index) {
        final plant = plantList[index];
        return ClipRRect(
          borderRadius: BorderRadius.circular(kDefaultBorderRaduis),
          child: GestureDetector(
            onTap: () => onTap(plant), // Gọi callback khi nhấn vào một mục
            child: PlantTile(
              plantCard: plant,
              onTap: () {},
            ),
          ),
        );
      },
    );
  }
}
// class MyPlants extends StatelessWidget {
//   final List<PlantView> plantList;
//   final Function(PlantView) onTap;

//   const MyPlants({
//     Key? key,
//     required this.plantList,
//     required this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: plantList.length,
//       itemBuilder: (context, index) {
//         final plant = plantList[index];
//         return ListTile(
//           leading: Image.asset(plant.imageUrl, width: 50, height: 50),
//           title: Text(plant.species),
//           subtitle: Text(plant.condition),
//           onTap: () => onTap(plant), // Gọi callback khi nhấn vào một mục
//         );
//       },
//     );
//   }
// }

class PlantTile extends StatelessWidget {
  const PlantTile(
      {Key? key,
      required this.plantCard,
      this.packed = false,
      required Null Function() onTap})
      : super(key: key);

  final PlantView plantCard;
  final bool packed;

  @override
  Widget build(BuildContext context) {
    DateFormat _format = DateFormat.yMMMd();
    return Container(
      padding: EdgeInsets.all(kDefaultPadding * 0.6),
      child: Stack(
        children: [
          Row(
            children: [
              Container(
                height: this.packed ? 95 : 130,
                width: this.packed ? 95 : 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kDefaultBorderRaduis),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(plantCard.imageUrl),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Container(
                height: this.packed ? 95 : 130,
                padding: EdgeInsets.symmetric(
                  vertical: this.packed
                      ? kDefaultPadding * 0.1
                      : kDefaultPadding * 0.3,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      plantCard.species,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        vertical: kDefaultPadding * 0.2,
                        horizontal: kDefaultPadding * 0.5,
                      ),
                      child: Text(
                        plantCard.condition,
                        style: TextStyle(
                          fontSize: 12,
                          color: plantCard.condition == 'Healthy'
                              ? Theme.of(context).colorScheme.secondary
                              : Theme.of(context).colorScheme.error,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(kDefaultBorderRaduis),
                        color: (plantCard.condition == 'Healthy'
                                ? Theme.of(context).colorScheme.secondary
                                : Theme.of(context).colorScheme.error)
                            .withOpacity(0.1),
                      ),
                    ),
                    Spacer(),
                    Text(_format.format(plantCard.date)),
                  ],
                ),
              ),
            ],
          ),
          this.packed
              ? Center()
              : Positioned(
                  right: 0,
                  top: kDefaultPadding * 0.3,
                  child: MoreMenuBox(
                    options: [
                      MoreItem(text: 'Rename'),
                      MoreItem(
                        text: 'Delete',
                        red: true,
                      ),
                    ],
                  ),
                ),
        ],
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context)
                .colorScheme
                .secondaryContainer
                .withOpacity(0.23),
            blurRadius: 6.0,
          ),
        ],
        color: Theme.of(context).colorScheme.background,
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
