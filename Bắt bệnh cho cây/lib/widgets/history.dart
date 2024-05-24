// import 'package:flutter/material.dart';
// import 'package:app/config/constants.dart';
// import 'package:app/widgets/widgets.dart';
// import 'package:app/widgets/plant_view.dart';

// class HistoryPlants extends StatefulWidget {
//   const HistoryPlants({Key? key, required this.plantList}) : super(key: key);
//   final List<PlantView> plantList;

//   @override
//   _HistoryPlantsState createState() => _HistoryPlantsState();
// }

// class _HistoryPlantsState extends State<HistoryPlants> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       itemCount: widget.plantList.length,
//       separatorBuilder: (context, index) => SizedBox(
//         height: 15,
//       ),
//       itemBuilder: (context, index) {
//         PlantView _plantCard = widget.plantList[index];
//         return ClipRRect(
//           borderRadius: BorderRadius.circular(kDefaultBorderRaduis),
//           child: Dismissible(
//             background: removeWidget(),
//             secondaryBackground: addWidget(),
//             key: ValueKey(_plantCard),
//             child: PlantTile(
//               plantCard: _plantCard,
//               packed: true,
//             ),
//             onDismissed: (DismissDirection direction) {
//               setState(() {
//                 widget.plantList.removeAt(index);
//               });
//             },
//           ),
//         );
//       },
//     );
//   }

//   removeWidget() {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
//       alignment: Alignment.centerLeft,
//       child: Text(
//         'Remove',
//         style: TextStyle(
//             color: Theme.of(context).colorScheme.onError,
//             fontSize: 32,
//             fontWeight: FontWeight.bold),
//       ),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(kDefaultBorderRaduis),
//           color: Theme.of(context).colorScheme.error),
//     );
//   }

//   addWidget() {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
//       alignment: Alignment.centerRight,
//       child: Text(
//         'Add',
//         style: TextStyle(
//             color: Theme.of(context).colorScheme.onError,
//             fontSize: 32,
//             fontWeight: FontWeight.bold),
//       ),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(kDefaultBorderRaduis),
//           color: Theme.of(context).colorScheme.primary),
//     );
//   }
// }
