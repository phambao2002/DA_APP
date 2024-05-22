// // // import 'package:flutter/material.dart';
// // // import 'package:intl/intl.dart';
// // // import 'package:app/config/constants.dart';
// // // import 'package:app/widgets/widgets.dart';
// // // import 'moreMenu.dart';

// // // // class HistoryPlants extends StatefulWidget {
// // // //   const HistoryPlants({Key? key, required this.plantList}) : super(key: key);
// // // //   final List<PlantView> plantList;

// // // //   @override
// // // //   _HistoryPlantsState createState() => _HistoryPlantsState();
// // // // }

// // // // class _HistoryPlantsState extends State<HistoryPlants> {
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return ListView.separated(
// // // //       itemCount: widget.plantList.length,
// // // //       separatorBuilder: (context, index) => SizedBox(
// // // //         height: 15,
// // // //       ),
// // // //       itemBuilder: (context, index) {
// // // //         PlantView _plantCard = widget.plantList[index];
// // // //         return ClipRRect(
// // // //           borderRadius: BorderRadius.circular(kDefaultBorderRaduis),
// // // //           child: Dismissible(
// // // //             background: removeWidget(),
// // // //             secondaryBackground: addWidget(),
// // // //             key: ValueKey(_plantCard),
// // // //             child: PlantTile(
// // // //               plantCard: _plantCard,
// // // //               packed: true,
// // // //             ),
// // // //             onDismissed: (DismissDirection direction) {
// // // //               setState(() {
// // // //                 widget.plantList.removeAt(index);
// // // //               });
// // // //             },
// // // //           ),
// // // //         );
// // // //       },
// // // //     );
// // // //   }

// // // //   removeWidget() {
// // // //     return Container(
// // // //       padding: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
// // // //       alignment: Alignment.centerLeft,
// // // //       child: Text(
// // // //         'Remove',
// // // //         style: TextStyle(
// // // //             color: Theme.of(context).colorScheme.onError,
// // // //             fontSize: 32,
// // // //             fontWeight: FontWeight.bold),
// // // //       ),
// // // //       decoration: BoxDecoration(
// // // //           borderRadius: BorderRadius.circular(kDefaultBorderRaduis),
// // // //           color: Theme.of(context).colorScheme.error),
// // // //     );
// // // //   }

// // // //   addWidget() {
// // // //     return Container(
// // // //       padding: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
// // // //       alignment: Alignment.centerRight,
// // // //       child: Text(
// // // //         'Add',
// // // //         style: TextStyle(
// // // //             color: Theme.of(context).colorScheme.onError,
// // // //             fontSize: 32,
// // // //             fontWeight: FontWeight.bold),
// // // //       ),
// // // //       decoration: BoxDecoration(
// // // //           borderRadius: BorderRadius.circular(kDefaultBorderRaduis),
// // // //           color: Theme.of(context).colorScheme.primary),
// // // //     );
// // // //   }
// // // // }
// // // class PlantListScreen extends StatelessWidget {
// // //   final List<PlantView> _plantList = [
// // //     PlantView(
// // //         imageUrl: 'assets/images/anh3.jpg',
// // //         species: 'Đốm lá',
// // //         condition: 'Bị đốm lá',
// // //         date: DateTime(2024, 5, 20)),
// // //     PlantView(
// // //         imageUrl: 'assets/images/anh4.jpg',
// // //         species: 'Cầu riêng',
// // //         condition: 'Cháy lá',
// // //         date: DateTime(2024, 05, 16)),
// // //     PlantView(
// // //         imageUrl: 'assets/images/anh5.jpg',
// // //         species: 'Cây bưởi',
// // //         condition: 'Vàng lá',
// // //         date: DateTime(2024, 05, 15)),
// // //     PlantView(
// // //         imageUrl: 'assets/images/anh6.jpg',
// // //         species: 'Bắp cải',
// // //         condition: 'Nấm',
// // //         date: DateTime(2024, 05, 14)),
// // //     PlantView(
// // //         imageUrl: 'assets/images/anh7.jpg',
// // //         species: 'Lá cải',
// // //         condition: 'Bệnh đốm trắng',
// // //         date: DateTime(2024, 05, 13)),
// // //     PlantView(
// // //         imageUrl: 'assets/images/anh8.jpg',
// // //         species: 'Cây bơ',
// // //         condition: 'Thối rễ',
// // //         date: DateTime(2024, 05, 10)),
// // //   ];
// // // class MyPlants extends StatefulWidget {
// // //   const MyPlants({Key? key, required this.plantList}) : super(key: key);
// // //   final List<PlantView> plantList;

// // //   @override
// // //   _MyPlantsState createState() => _MyPlantsState();
// // // }

// // // class _MyPlantsState extends State<MyPlants> {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return ListView.separated(
// // //       itemCount: widget.plantList.length,
// // //       separatorBuilder: (context, index) => SizedBox(
// // //         height: 15,
// // //       ),
// // //       itemBuilder: (context, index) {
// // //         PlantView _plantCard = widget.plantList[index];
// // //         return ClipRRect(
// // //             borderRadius: BorderRadius.circular(kDefaultBorderRaduis),
// // //             child: PlantTile(plantCard: _plantCard));
// // //       },
// // //     );
// // //   }
// // // }

// // // class PlantTile extends StatelessWidget {
// // //   const PlantTile({Key? key, required PlantView plantCard, this.packed = false})
// // //       : _plantCard = plantCard,
// // //         super(key: key);

// // //   final PlantView _plantCard;
// // //   final bool packed;

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     DateFormat _format = DateFormat.yMMMd();
// // //     return Container(
// // //       padding: EdgeInsets.all(kDefaultPadding * 0.6),
// // //       child: Stack(children: [
// // //         Row(
// // //           children: [
// // //             Container(
// // //               height: this.packed ? 95 : 130, //140
// // //               width: this.packed ? 95 : 130,
// // //               decoration: BoxDecoration(
// // //                 borderRadius: BorderRadius.circular(kDefaultBorderRaduis),
// // //                 image: DecorationImage(
// // //                   fit: BoxFit.cover,
// // //                   image: AssetImage(_plantCard.imageUrl),
// // //                 ),
// // //               ),
// // //             ),
// // //             SizedBox(
// // //               width: 20,
// // //             ),
// // //             Container(
// // //               height: this.packed ? 95 : 130,
// // //               padding: EdgeInsets.symmetric(
// // //                   vertical: this.packed
// // //                       ? kDefaultPadding * 0.1
// // //                       : kDefaultPadding * 0.3),
// // //               child: Column(
// // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // //                 children: [
// // //                   Text(
// // //                     _plantCard.species,
// // //                     style: TextStyle(
// // //                         fontSize: 20,
// // //                         fontWeight: FontWeight.bold,
// // //                         color: Theme.of(context).colorScheme.onBackground),
// // //                   ),
// // //                   Container(
// // //                     alignment: Alignment.center,
// // //                     padding: EdgeInsets.symmetric(
// // //                         vertical: kDefaultPadding * 0.2,
// // //                         horizontal: kDefaultPadding * 0.5),
// // //                     child: Text(
// // //                       _plantCard.condition,
// // //                       style: TextStyle(
// // //                           fontSize: 12,
// // //                           color: _plantCard.condition == 'Healthy'
// // //                               ? Theme.of(context).colorScheme.secondary
// // //                               : Theme.of(context).colorScheme.error,
// // //                           fontWeight: FontWeight.bold),
// // //                     ),
// // //                     decoration: BoxDecoration(
// // //                         borderRadius:
// // //                             BorderRadius.circular(kDefaultBorderRaduis),
// // //                         color: (_plantCard.condition == 'Healthy'
// // //                                 ? Theme.of(context).colorScheme.secondary
// // //                                 : Theme.of(context).colorScheme.error)
// // //                             .withOpacity(0.1)),
// // //                   ),
// // //                   Spacer(),
// // //                   Text(_format.format(_plantCard.date)),
// // //                 ],
// // //               ),
// // //             )
// // //           ],
// // //         ),
// // //         this.packed
// // //             ? Center()
// // //             : Positioned(
// // //                 right: 0,
// // //                 top: kDefaultPadding * 0.3,
// // //                 child: MoreMenuBox(
// // //                   options: [
// // //                     MoreItem(text: 'Rename'),
// // //                     MoreItem(
// // //                       text: 'Delete',
// // //                       red: true,
// // //                     )
// // //                   ],
// // //                 ))
// // //       ]),
// // //       decoration: BoxDecoration(boxShadow: [
// // //         BoxShadow(
// // //           color: Theme.of(context)
// // //               .colorScheme
// // //               .secondaryContainer
// // //               .withOpacity(0.23),
// // //           blurRadius: 6.0,
// // //         ),
// // //       ], color: Theme.of(context).colorScheme.background),
// // //     );
// // //   }
// // // }

// // // class PlantView {
// // //   final String imageUrl;
// // //   final String species;
// // //   final String condition;
// // //   final DateTime date;
// // //   const PlantView({
// // //     required this.imageUrl,
// // //     required this.species,
// // //     required this.condition,
// // //     required this.date,
// // //   });
// // // }
// // import 'package:flutter/material.dart';
// // import 'package:intl/intl.dart';
// // import 'package:app/config/constants.dart';
// // import 'package:app/widgets/widgets.dart';
// // import 'moreMenu.dart';

// // class MyPlants extends StatefulWidget {
// //   const MyPlants({Key? key, required this.plantList}) : super(key: key);
// //   final List<PlantView> plantList;

// //   @override
// //   _MyPlantsState createState() => _MyPlantsState();
// // }

// // class _MyPlantsState extends State<MyPlants> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return ListView.separated(
// //       itemCount: widget.plantList.length,
// //       separatorBuilder: (context, index) => SizedBox(
// //         height: 15,
// //       ),
// //       itemBuilder: (context, index) {
// //         PlantView _plantCard = widget.plantList[index];
// //         return ClipRRect(
// //             borderRadius: BorderRadius.circular(kDefaultBorderRaduis),
// //             child: PlantTile(plantCard: _plantCard));
// //       },
// //     );
// //   }
// // }

// // class PlantListScreen extends StatelessWidget {
// //   final List<PlantView> _plantList = [
// //     PlantView(
// //         imageUrl: 'assets/images/anh3.jpg',
// //         species: 'Đốm lá',
// //         condition: 'Bị đốm lá',
// //         date: DateTime(2024, 5, 20)),
// //     PlantView(
// //         imageUrl: 'assets/images/anh4.jpg',
// //         species: 'Cầu riêng',
// //         condition: 'Cháy lá',
// //         date: DateTime(2024, 05, 16)),
// //     PlantView(
// //         imageUrl: 'assets/images/anh5.jpg',
// //         species: 'Cây bưởi',
// //         condition: 'Vàng lá',
// //         date: DateTime(2024, 05, 15)),
// //     PlantView(
// //         imageUrl: 'assets/images/anh6.jpg',
// //         species: 'Bắp cải',
// //         condition: 'Nấm',
// //         date: DateTime(2024, 05, 14)),
// //     PlantView(
// //         imageUrl: 'assets/images/anh7.jpg',
// //         species: 'Lá cải',
// //         condition: 'Bệnh đốm trắng',
// //         date: DateTime(2024, 05, 13)),
// //     PlantView(
// //         imageUrl: 'assets/images/anh8.jpg',
// //         species: 'Cây bơ',
// //         condition: 'Thối rễ',
// //         date: DateTime(2024, 05, 10)),
// //   ];

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Plant List'),
// //       ),
// //       body: ListView.builder(
// //         itemCount: _plantList.length,
// //         itemBuilder: (context, index) {
// //           return PlantTile(plantCard: _plantList[index]);
// //         },
// //       ),
// //     );
// //   }
// // }

// // class PlantTile extends StatelessWidget {
// //   const PlantTile({Key? key, required PlantView plantCard, this.packed = false})
// //       : _plantCard = plantCard,
// //         super(key: key);

// //   final PlantView _plantCard;
// //   final bool packed;

// //   @override
// //   Widget build(BuildContext context) {
// //     DateFormat _format = DateFormat.yMMMd();
// //     return Container(
// //       padding: EdgeInsets.all(kDefaultPadding * 0.6),
// //       child: Stack(children: [
// //         Row(
// //           children: [
// //             Container(
// //               height: this.packed ? 95 : 130, //140
// //               width: this.packed ? 95 : 130,
// //               decoration: BoxDecoration(
// //                 borderRadius: BorderRadius.circular(kDefaultBorderRaduis),
// //                 image: DecorationImage(
// //                   fit: BoxFit.cover,
// //                   image: AssetImage(_plantCard.imageUrl),
// //                 ),
// //               ),
// //             ),
// //             SizedBox(
// //               width: 20,
// //             ),
// //             Container(
// //               height: this.packed ? 95 : 130,
// //               padding: EdgeInsets.symmetric(
// //                   vertical: this.packed
// //                       ? kDefaultPadding * 0.1
// //                       : kDefaultPadding * 0.3),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Text(
// //                     _plantCard.species,
// //                     style: TextStyle(
// //                         fontSize: 20,
// //                         fontWeight: FontWeight.bold,
// //                         color: Theme.of(context).colorScheme.onBackground),
// //                   ),
// //                   Container(
// //                     alignment: Alignment.center,
// //                     padding: EdgeInsets.symmetric(
// //                         vertical: kDefaultPadding * 0.2,
// //                         horizontal: kDefaultPadding * 0.5),
// //                     child: Text(
// //                       _plantCard.condition,
// //                       style: TextStyle(
// //                           fontSize: 12,
// //                           color: _plantCard.condition == 'Healthy'
// //                               ? Theme.of(context).colorScheme.secondary
// //                               : Theme.of(context).colorScheme.error,
// //                           fontWeight: FontWeight.bold),
// //                     ),
// //                     decoration: BoxDecoration(
// //                         borderRadius:
// //                             BorderRadius.circular(kDefaultBorderRaduis),
// //                         color: (_plantCard.condition == 'Healthy'
// //                                 ? Theme.of(context).colorScheme.secondary
// //                                 : Theme.of(context).colorScheme.error)
// //                             .withOpacity(0.1)),
// //                   ),
// //                   Spacer(),
// //                   Text(_format.format(_plantCard.date)),
// //                 ],
// //               ),
// //             )
// //           ],
// //         ),
// //         this.packed
// //             ? Center()
// //             : Positioned(
// //                 right: 0,
// //                 top: kDefaultPadding * 0.3,
// //                 child: MoreMenuBox(
// //                   options: [
// //                     MoreItem(text: 'Rename'),
// //                     MoreItem(
// //                       text: 'Delete',
// //                       red: true,
// //                     )
// //                   ],
// //                 ))
// //       ]),
// //       decoration: BoxDecoration(boxShadow: [
// //         BoxShadow(
// //           color: Theme.of(context)
// //               .colorScheme
// //               .secondaryContainer
// //               .withOpacity(0.23),
// //           blurRadius: 6.0,
// //         ),
// //       ], color: Theme.of(context).colorScheme.background),
// //     );
// //   }
// // }

// // class PlantView {
// //   final String imageUrl;
// //   final String species;
// //   final String condition;
// //   final DateTime date;
// //   const PlantView({
// //     required this.imageUrl,
// //     required this.species,
// //     required this.condition,
// //     required this.date,
// //   });
// // }
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:app/config/constants.dart'; // Ensure this file exists and contains your constants
// import 'package:app/widgets/widgets.dart'; // Ensure this file exists and contains your widgets
// import 'moreMenu.dart'; // Ensure this file exists and contains your MoreMenuBox and MoreItem

// class MyPlants extends StatefulWidget {
//   const MyPlants({Key? key, required this.plantList}) : super(key: key);
//   final List<PlantView> plantList;

//   @override
//   _MyPlantsState createState() => _MyPlantsState();
// }

// class _MyPlantsState extends State<MyPlants> {
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
//             borderRadius: BorderRadius.circular(kDefaultBorderRaduis),
//             child: PlantTile(plantCard: _plantCard));
//       },
//     );
//   }
// }

// class PlantListScreen extends StatelessWidget {
//   final List<PlantView> _plantList = [
//     PlantView(
//         imageUrl: 'assets/images/anh3.jpg',
//         species: 'Đốm lá',
//         condition: 'Bị đốm lá',
//         date: DateTime(2024, 5, 20)),
//     PlantView(
//         imageUrl: 'assets/images/anh4.jpg',
//         species: 'Cầu riêng',
//         condition: 'Cháy lá',
//         date: DateTime(2024, 5, 16)),
//     PlantView(
//         imageUrl: 'assets/images/anh5.jpg',
//         species: 'Cây bưởi',
//         condition: 'Vàng lá',
//         date: DateTime(2024, 5, 15)),
//     PlantView(
//         imageUrl: 'assets/images/anh6.jpg',
//         species: 'Bắp cải',
//         condition: 'Nấm',
//         date: DateTime(2024, 5, 14)),
//     PlantView(
//         imageUrl: 'assets/images/anh7.jpg',
//         species: 'Lá cải',
//         condition: 'Bệnh đốm trắng',
//         date: DateTime(2024, 5, 13)),
//     PlantView(
//         imageUrl: 'assets/images/anh8.jpg',
//         species: 'Cây bơ',
//         condition: 'Thối rễ',
//         date: DateTime(2024, 5, 10)),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Plant List'),
//       ),
//       body: ListView.builder(
//         itemCount: _plantList.length,
//         itemBuilder: (context, index) {
//           return PlantTile(plantCard: _plantList[index]);
//         },
//       ),
//     );
//   }
// }

// class PlantTile extends StatelessWidget {
//   const PlantTile({Key? key, required PlantView plantCard, this.packed = false})
//       : _plantCard = plantCard,
//         super(key: key);

//   final PlantView _plantCard;
//   final bool packed;

//   @override
//   Widget build(BuildContext context) {
//     DateFormat _format = DateFormat.yMMMd();
//     return Container(
//       padding: EdgeInsets.all(kDefaultPadding * 0.6),
//       child: Stack(children: [
//         Row(
//           children: [
//             Container(
//               height: this.packed ? 95 : 130, //140
//               width: this.packed ? 95 : 130,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(kDefaultBorderRaduis),
//                 image: DecorationImage(
//                   fit: BoxFit.cover,
//                   image: AssetImage(_plantCard.imageUrl),
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 20,
//             ),
//             Container(
//               height: this.packed ? 95 : 130,
//               padding: EdgeInsets.symmetric(
//                   vertical: this.packed
//                       ? kDefaultPadding * 0.1
//                       : kDefaultPadding * 0.3),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     _plantCard.species,
//                     style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Theme.of(context).colorScheme.onBackground),
//                   ),
//                   Container(
//                     alignment: Alignment.center,
//                     padding: EdgeInsets.symmetric(
//                         vertical: kDefaultPadding * 0.2,
//                         horizontal: kDefaultPadding * 0.5),
//                     child: Text(
//                       _plantCard.condition,
//                       style: TextStyle(
//                           fontSize: 12,
//                           color: _plantCard.condition == 'Healthy'
//                               ? Theme.of(context).colorScheme.secondary
//                               : Theme.of(context).colorScheme.error,
//                           fontWeight: FontWeight.bold),
//                     ),
//                     decoration: BoxDecoration(
//                         borderRadius:
//                             BorderRadius.circular(kDefaultBorderRaduis),
//                         color: (_plantCard.condition == 'Healthy'
//                                 ? Theme.of(context).colorScheme.secondary
//                                 : Theme.of(context).colorScheme.error)
//                             .withOpacity(0.1)),
//                   ),
//                   Spacer(),
//                   Text(_format.format(_plantCard.date)),
//                 ],
//               ),
//             )
//           ],
//         ),
//         this.packed
//             ? Center()
//             : Positioned(
//                 right: 0,
//                 top: kDefaultPadding * 0.3,
//                 child: MoreMenuBox(
//                   options: [
//                     MoreItem(text: 'Rename'),
//                     MoreItem(
//                       text: 'Delete',
//                       red: true,
//                     )
//                   ],
//                 ))
//       ]),
//       decoration: BoxDecoration(boxShadow: [
//         BoxShadow(
//           color: Theme.of(context)
//               .colorScheme
//               .secondaryContainer
//               .withOpacity(0.23),
//           blurRadius: 6.0,
//         ),
//       ], color: Theme.of(context).colorScheme.background),
//     );
//   }
// }

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
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:app/config/constants.dart'; // Ensure this file exists and contains your constants
import 'package:app/widgets/widgets.dart'; // Ensure this file exists and contains your widgets
import 'moreMenu.dart'; // Ensure this file exists and contains your MoreMenuBox and MoreItem

class MyPlants extends StatefulWidget {
  const MyPlants({Key? key, required this.plantList, required this.onTap})
      : super(key: key);
  final List<PlantView> plantList;
  final Function(PlantView) onTap;
  @override
  _MyPlantsState createState() => _MyPlantsState();
}

class _MyPlantsState extends State<MyPlants> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: widget.plantList.length,
      separatorBuilder: (context, index) => SizedBox(
        height: 15,
      ),
      itemBuilder: (context, index) {
        PlantView _plantCard = widget.plantList[index];
        return ClipRRect(
            borderRadius: BorderRadius.circular(kDefaultBorderRaduis),
            child: PlantTile(plantCard: _plantCard));
      },
    );
  }
}

class PlantListScreen extends StatelessWidget {
  final List<PlantView> _plantList = [
    PlantView(
        imageUrl: 'assets/images/anh3.jpg',
        species: 'Đốm lá',
        condition: 'Bị đốm lá',
        date: DateTime(2024, 5, 20)),
    PlantView(
        imageUrl: 'assets/images/anh4.jpg',
        species: 'Cầu riêng',
        condition: 'Cháy lá',
        date: DateTime(2024, 5, 16)),
    PlantView(
        imageUrl: 'assets/images/anh5.jpg',
        species: 'Cây bưởi',
        condition: 'Vàng lá',
        date: DateTime(2024, 5, 15)),
    PlantView(
        imageUrl: 'assets/images/anh6.jpg',
        species: 'Bắp cải',
        condition: 'Nấm',
        date: DateTime(2024, 5, 14)),
    PlantView(
        imageUrl: 'assets/images/anh7.jpg',
        species: 'Lá cải',
        condition: 'Bệnh đốm trắng',
        date: DateTime(2024, 5, 13)),
    PlantView(
        imageUrl: 'assets/images/anh8.jpg',
        species: 'Cây bơ',
        condition: 'Thối rễ',
        date: DateTime(2024, 5, 10)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plant List'),
      ),
      body: ListView.builder(
        itemCount: _plantList.length,
        itemBuilder: (context, index) {
          return PlantTile(plantCard: _plantList[index]);
        },
      ),
    );
  }
}

class PlantTile extends StatelessWidget {
  const PlantTile({Key? key, required PlantView plantCard, this.packed = false})
      : _plantCard = plantCard,
        super(key: key);

  final PlantView _plantCard;
  final bool packed;

  @override
  Widget build(BuildContext context) {
    DateFormat _format = DateFormat.yMMMd();
    return Container(
      padding: EdgeInsets.all(kDefaultPadding * 0.6),
      child: Stack(children: [
        Row(
          children: [
            Container(
              height: this.packed ? 95 : 130, //140
              width: this.packed ? 95 : 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kDefaultBorderRaduis),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(_plantCard.imageUrl),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              height: this.packed ? 95 : 130,
              padding: EdgeInsets.symmetric(
                  vertical: this.packed
                      ? kDefaultPadding * 0.1
                      : kDefaultPadding * 0.3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _plantCard.species,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                        vertical: kDefaultPadding * 0.2,
                        horizontal: kDefaultPadding * 0.5),
                    child: Text(
                      _plantCard.condition,
                      style: TextStyle(
                          fontSize: 12,
                          color: _plantCard.condition == 'Healthy'
                              ? Theme.of(context).colorScheme.secondary
                              : Theme.of(context).colorScheme.error,
                          fontWeight: FontWeight.bold),
                    ),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(kDefaultBorderRaduis),
                        color: (_plantCard.condition == 'Healthy'
                                ? Theme.of(context).colorScheme.secondary
                                : Theme.of(context).colorScheme.error)
                            .withOpacity(0.1)),
                  ),
                  Spacer(),
                  Text(_format.format(_plantCard.date)),
                ],
              ),
            )
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
                    )
                  ],
                ))
      ]),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Theme.of(context)
              .colorScheme
              .secondaryContainer
              .withOpacity(0.23),
          blurRadius: 6.0,
        ),
      ], color: Theme.of(context).colorScheme.background),
    );
  }
}

class PlantView {
  final String imageUrl;
  final String species;
  final String condition;
  final DateTime date;
  const PlantView({
    required this.imageUrl,
    required this.species,
    required this.condition,
    required this.date,
  });
}
