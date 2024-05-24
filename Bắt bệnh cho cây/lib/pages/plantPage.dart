// import 'package:app/widgets/PlantDetail.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:app/config/constants.dart';
// import 'package:app/widgets/dialog.dart';
// import 'package:app/widgets/divider.dart';
// import 'package:app/widgets/widgets.dart';
// import 'package:app/widgets/plantList.dart';
// import 'package:app/widgets/plant_view.dart';

// class PlantPage extends StatefulWidget {
//   const PlantPage({Key? key}) : super(key: key);

//   @override
//   _PlantPageState createState() => _PlantPageState();
// }

// class _PlantPageState extends State<PlantPage>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     _tabController = TabController(length: 2, vsync: this);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _tabController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<PlantView> _plantList = [
//       PlantView(
//           imageUrl: 'assets/images/image_1.jpg',
//           species: 'Tomato',
//           condition: 'Healthy',
//           date: DateTime(2021, 4, 5)),
//       ...List.generate(
//           10,
//           (index) => PlantView(
//               imageUrl: 'assets/images/image_2.jpg',
//               species: 'Tomato',
//               condition: 'Cancer',
//               date: DateTime(2020, 12, 1)))
//     ];
//     return Container(
//       padding:
//           EdgeInsets.only(top: kDefaultPadding, bottom: kDefaultPadding / 2),
//       child: Column(children: [
//         Container(
//           margin: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
//           child: CustomTabBar(
//             tabController: _tabController,
//             tabTexts: ['My Plants', 'History'],
//           ),
//         ),
//         Expanded(
//           child: TabBarView(controller: _tabController, children: [
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
//               child: Column(
//                 children: [
//                   Container(
//                     height: 54,
//                     margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
//                     child: Row(children: [
//                       Expanded(
//                         child: SearchBar(),
//                       ),
//                       SizedBox(width: 20),
//                       SortMenuBox(options: [
//                         SortItem(text: 'Date'),
//                         SortItem(text: 'Alphabet')
//                       ])
//                     ]),
//                   ),
//                   // Expanded(
//                   //   child: ClipRRect(
//                   //     borderRadius: BorderRadius.circular(kDefaultBorderRaduis),
//                   //     child: MyPlants(
//                   //       plantList: _plantList,
//                   //       onTap: (PlantView) {},
//                   //     ),
//                   //   ),
//                   // ),
//                   //
// Expanded(
//   child: ClipRRect(
//     borderRadius: BorderRadius.circular(kDefaultBorderRaduis),
//     child: MyPlants(
//       plantList: _plantList,
//       onTap: (selectedPlant) {
//         // In ra thông tin của cây được nhấn vào
//         print('Selected Plant:');
//         print('Image URL: ${selectedPlant.imageUrl}');
//         print('Species: ${selectedPlant.species}');
//         print('Condition: ${selectedPlant.condition}');
//         print('Date: ${selectedPlant.date}');

//         // Chuyển đến màn hình chi tiết và truyền thông tin của cây
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) =>
//                 PlantDetail(plant: selectedPlant),
//           ),
//         );
//       },
//     ),
//   ),
// ),
//                 ],
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
//               child: Column(
//                 children: [
//                   Container(
//                     height: 54,
//                     margin: EdgeInsets.only(top: kDefaultPadding),
//                     child: Row(children: [
//                       Expanded(
//                         child: SearchBar(),
//                       ),
//                       SizedBox(width: 20),
//                       SortMenuBox(options: [
//                         SortItem(text: 'Latest'),
//                         SortItem(text: 'Oldest')
//                       ])
//                     ]),
//                   ),
//                   Container(
//                       height: 34,
//                       margin:
//                           EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
//                       child: ClipRRect(
//                         borderRadius:
//                             BorderRadius.circular(kDefaultBorderRaduis),
//                         child: ListView(
//                             scrollDirection: Axis.horizontal,
//                             children: [
//                               ButtonWidget(
//                                 text: Text('Apple',
//                                     style: TextStyle(
//                                         color: Theme.of(context)
//                                             .colorScheme
//                                             .onSecondary)),
//                                 onPressed: () {},
//                                 color: Theme.of(context).colorScheme.secondary,
//                               ),
//                               SizedBox(
//                                 width: 10,
//                               ),
//                               ButtonWidget(
//                                 text: Text('Potato',
//                                     style: TextStyle(
//                                         color: Theme.of(context)
//                                             .colorScheme
//                                             .onSecondary)),
//                                 onPressed: () {},
//                                 color: Theme.of(context).colorScheme.secondary,
//                               ),
//                               SizedBox(
//                                 width: 10,
//                               ),
//                               ButtonWidget(
//                                 text: Text('Tomato',
//                                     style: TextStyle(
//                                         color: Theme.of(context)
//                                             .colorScheme
//                                             .onSecondary)),
//                                 onPressed: () {},
//                                 color: Theme.of(context).colorScheme.secondary,
//                               ),
//                               DividerWidget(),
//                               ButtonWidget(
//                                   text: Text('Clear All',
//                                       style: TextStyle(
//                                           color: Theme.of(context)
//                                               .colorScheme
//                                               .onPrimary)),
//                                   color: Theme.of(context).colorScheme.error,
//                                   onPressed: () {
//                                     showDialog(
//                                         context: context,
//                                         builder: (BuildContext context) {
//                                           return DeleteDialog(
//                                               onPressed: () {
//                                                 _plantList.clear();
//                                               },
//                                               title:
//                                                   'Do you want to clear history?');
//                                         });
//                                   })
//                             ]),
//                       )),
//                   Expanded(
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(kDefaultBorderRaduis),
//                       child: HistoryPlants(plantList: _plantList),
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ]),
//         ),
//       ]),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:app/config/constants.dart';
// import 'package:app/widgets/dialog.dart';
// import 'package:app/widgets/divider.dart';
// import 'package:app/widgets/widgets.dart';
// import 'package:app/widgets/plantList.dart'; // Ensure the correct path is used here

// class CustomTabBar extends StatelessWidget {
//   final TabController tabController;
//   final List<String> tabTexts;
//   final Color labelColor;
//   final Color unselectedLabelColor;
//   final Color indicatorColor;
//   final TextStyle tabTextStyle;

//   const CustomTabBar({
//     required this.tabController,
//     required this.tabTexts,
//     this.labelColor = Colors.black,
//     this.unselectedLabelColor = Colors.grey,
//     this.indicatorColor = Colors.blue,
//     this.tabTextStyle = const TextStyle(fontSize: 16.0),
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TabBar(
//       controller: tabController,
//       labelColor: labelColor,
//       unselectedLabelColor: unselectedLabelColor,
//       indicatorColor: indicatorColor,
//       tabs: tabTexts.map((text) => Tab(text: text)).toList(),
//     );
//   }
// }

// class PlantPage extends StatefulWidget {
//   const PlantPage({Key? key}) : super(key: key);

//   @override
//   _PlantPageState createState() => _PlantPageState();
// }

// class _PlantPageState extends State<PlantPage>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     _tabController = TabController(length: 2, vsync: this);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<PlantView> _plantList = [
//       PlantView(
//           imageUrl: 'assets/images/anh3.jpg',
//           species: 'Đốm lá',
//           condition: 'Bị đốm lá',
//           date: DateTime(2024, 5, 20)),
//       PlantView(
//           imageUrl: 'assets/images/anh4.jpg',
//           species: 'Cầu riêng',
//           condition: 'Cháy lá',
//           date: DateTime(2024, 05, 16)),
//       PlantView(
//           imageUrl: 'assets/images/anh5.jpg',
//           species: 'Cây bưởi',
//           condition: 'Vàng lá',
//           date: DateTime(2024, 05, 15)),
//       PlantView(
//           imageUrl: 'assets/images/anh6.jpg',
//           species: 'Bắp cải',
//           condition: 'Nấm',
//           date: DateTime(2024, 05, 14)),
//       PlantView(
//           imageUrl: 'assets/images/anh7.jpg',
//           species: 'Lá cải',
//           condition: 'Bệnh đốm trắng',
//           date: DateTime(2024, 05, 13)),
//       PlantView(
//           imageUrl: 'assets/images/anh8.jpg',
//           species: 'Cây bơ',
//           condition: 'Thối rễ',
//           date: DateTime(2024, 05, 10)),
//     ];

//     return Container(
//       padding: const EdgeInsets.only(
//           top: kDefaultPadding, bottom: kDefaultPadding / 2),
//       child: Column(
//         children: [
//           Container(
//             margin: EdgeInsets.symmetric(vertical: 0),
//             padding: EdgeInsets.symmetric(vertical: 0),
//             decoration: BoxDecoration(
//               color: const Color.fromARGB(255, 53, 161, 99),
//               border: Border.all(
//                 color: const Color.fromARGB(255, 53, 161, 99),
//                 width: 0.0,
//               ),
//               borderRadius: BorderRadius.circular(8.0),
//             ),
//             height: 50.0,
//             child: CustomTabBar(
//               tabController: _tabController,
//               tabTexts: const ['My Plants', 'History'],
//               labelColor: const Color.fromARGB(255, 14, 15, 14),
//               unselectedLabelColor: const Color.fromARGB(255, 237, 236, 236),
//               indicatorColor: const Color.fromARGB(255, 241, 239, 239),
//               tabTextStyle: const TextStyle(fontSize: 30.0),
//             ),
//           ),
//           Expanded(
//             child: TabBarView(
//               controller: _tabController,
//               children: [
//                 // My Plants Tab
//                 Container(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: kDefaultPadding / 2),
//                   child: Column(
//                     children: [
//                       Container(
//                         height: 54,
//                         margin: const EdgeInsets.symmetric(
//                             vertical: kDefaultPadding),
//                         child: Row(
//                           children: [
//                             const Expanded(
//                               child: SearchBar(),
//                             ),
//                             const SizedBox(width: 20),
//                             IconButton(
//                               icon: const Icon(Icons.search),
//                               onPressed: () {
//                                 print('Search icon pressed');
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                       Expanded(
//                         child: ClipRRect(
//                           borderRadius:
//                               BorderRadius.circular(kDefaultBorderRaduis),
//                           child: MyPlants(
//                             plantList: _plantList,
//                             onTap: (PlantView) {},
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 // History Tab
//                 Column(
//                   children: [
//                     Container(
//                       height: 34,
//                       margin: const EdgeInsets.symmetric(
//                           vertical: kDefaultPadding / 2),
//                       child: ClipRRect(
//                         borderRadius:
//                             BorderRadius.circular(kDefaultBorderRaduis),
//                         child: ListView(
//                           scrollDirection: Axis.horizontal,
//                           children: [
//                             ButtonWidget(
//                               text: const Text('Cây sầu riêng',
//                                   style: TextStyle(
//                                       color: Color.fromARGB(255, 6, 6, 6))),
//                               onPressed: () {},
//                             ),
//                             const SizedBox(width: 10),
//                             ButtonWidget(
//                               text: const Text('Bắp cải',
//                                   style: TextStyle(
//                                       color: Color.fromARGB(255, 4, 4, 4))),
//                               onPressed: () {},
//                               color: Theme.of(context).colorScheme.secondary,
//                             ),
//                             const SizedBox(width: 10),
//                             ButtonWidget(
//                               text: const Text('Cây bơ',
//                                   style: TextStyle(
//                                       color: Color.fromARGB(255, 7, 7, 7))),
//                               onPressed: () {},
//                               color: Theme.of(context).colorScheme.secondary,
//                             ),
//                             const SizedBox(width: 10),
//                             DividerWidget(),
//                             ButtonWidget(
//                               text: Text('Clear All',
//                                   style: TextStyle(
//                                       color: Theme.of(context)
//                                           .colorScheme
//                                           .onPrimary)),
//                               color: Theme.of(context).colorScheme.error,
//                               onPressed: () {
//                                 showDialog(
//                                   context: context,
//                                   builder: (BuildContext context) {
//                                     return DeleteDialog(
//                                       onPressed: () {
//                                         setState(() {
//                                           _plantList.clear();
//                                         });
//                                       },
//                                       title: 'Do you want to clear history?',
//                                     );
//                                   },
//                                 );
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: ClipRRect(
//                         borderRadius:
//                             BorderRadius.circular(kDefaultBorderRaduis),
//                         child: HistoryPlants(plantList: _plantList),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:app/config/constants.dart';
import 'package:app/widgets/dialog.dart';
import 'package:app/widgets/divider.dart';
import 'package:app/widgets/widgets.dart';
import 'package:app/widgets/plantList.dart'; // Ensure the correct path is used here
import 'package:app/widgets/PlantDetail.dart';
import 'package:flutter/rendering.dart';
import 'package:app/widgets/plant_view.dart';

class CustomTabBar extends StatelessWidget {
  final TabController tabController;
  final List<String> tabTexts;
  final Color labelColor;
  final Color unselectedLabelColor;
  final Color indicatorColor;
  final TextStyle tabTextStyle;

  const CustomTabBar({
    required this.tabController,
    required this.tabTexts,
    this.labelColor = Colors.black,
    this.unselectedLabelColor = Colors.grey,
    this.indicatorColor = Colors.blue,
    this.tabTextStyle = const TextStyle(fontSize: 16.0),
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      labelColor: labelColor,
      unselectedLabelColor: unselectedLabelColor,
      indicatorColor: indicatorColor,
      tabs: tabTexts.map((text) => Tab(text: text)).toList(),
    );
  }
}

class PlantPage extends StatefulWidget {
  const PlantPage({Key? key}) : super(key: key);

  @override
  _PlantPageState createState() => _PlantPageState();
}

class _PlantPageState extends State<PlantPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late TextEditingController _searchController;
  List<PlantView> _plantList = [];
  List<PlantView> _filteredPlantList = [];

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _searchController = TextEditingController();
    _initializePlantList();
    super.initState();
  }

  void _initializePlantList() {
    _plantList = [
      PlantView(
          imageUrl: 'assets/images/anh3.jpg',
          species: 'Đốm lá',
          condition: 'Bị đốm lá',
          date: DateTime(2024, 5, 20)),
      PlantView(
          imageUrl: 'assets/images/anh4.jpg',
          species: 'Cầu riêng',
          condition: 'Cháy lá',
          date: DateTime(2024, 05, 16)),
      PlantView(
          imageUrl: 'assets/images/anh5.jpg',
          species: 'Cây bưởi',
          condition: 'Vàng lá',
          date: DateTime(2024, 05, 15)),
      PlantView(
          imageUrl: 'assets/images/anh6.jpg',
          species: 'Bắp cải',
          condition: 'Nấm',
          date: DateTime(2024, 05, 14)),
      PlantView(
          imageUrl: 'assets/images/anh7.jpg',
          species: 'Lá cải',
          condition: 'Bệnh đốm trắng',
          date: DateTime(2024, 05, 13)),
      PlantView(
          imageUrl: 'assets/images/anh8.jpg',
          species: 'Cây bơ',
          condition: 'Thối rễ',
          date: DateTime(2024, 05, 10)),
    ];
    _filteredPlantList = _plantList;
  }

  void _filterPlants(String query) {
    if (query.isEmpty) {
      _filteredPlantList = _plantList;
    } else {
      _filteredPlantList = _plantList
          .where((plant) =>
              plant.species.toLowerCase().contains(query.toLowerCase()) ||
              plant.condition.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    setState(() {});
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          top: kDefaultPadding, bottom: kDefaultPadding / 2),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 0),
            padding: EdgeInsets.symmetric(vertical: 0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 53, 161, 99),
              border: Border.all(
                color: const Color.fromARGB(255, 53, 161, 99),
                width: 0.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            height: 50.0,
            child: CustomTabBar(
              tabController: _tabController,
              tabTexts: const ['My Plants', 'History'],
              labelColor: const Color.fromARGB(255, 14, 15, 14),
              unselectedLabelColor: const Color.fromARGB(255, 237, 236, 236),
              indicatorColor: const Color.fromARGB(255, 241, 239, 239),
              tabTextStyle: const TextStyle(fontSize: 30.0),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // My Plants Tab
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding / 2),
                  child: Column(
                    children: [
                      Container(
                        height: 54,
                        margin: const EdgeInsets.symmetric(
                            vertical: kDefaultPadding),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _searchController,
                                decoration: InputDecoration(
                                  hintText: 'Search plants...',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        kDefaultBorderRaduis),
                                  ),
                                ),
                                onChanged: _filterPlants,
                              ),
                            ),
                            const SizedBox(width: 20),
                            IconButton(
                              icon: const Icon(Icons.search),
                              onPressed: () {
                                _filterPlants(_searchController.text);
                              },
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(kDefaultBorderRaduis),
                          child: MyPlants(
                            plantList: _plantList,
                            onTap: (selectedPlant) {
                              // In ra thông tin của cây được nhấn vào
                              print('Selected Plant:');
                              print('Image URL: ${selectedPlant.imageUrl}');
                              print('Species: ${selectedPlant.species}');
                              print('Condition: ${selectedPlant.condition}');
                              print('Date: ${selectedPlant.date}');

                              // Chuyển đến màn hình chi tiết và truyền thông tin của cây
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PlantDetail(plant: selectedPlant),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // History Tab
                Column(
                  children: [
                    Container(
                      height: 34,
                      margin: const EdgeInsets.symmetric(
                          vertical: kDefaultPadding / 2),
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(kDefaultBorderRaduis),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            ButtonWidget(
                              text: const Text('Cây sầu riêng',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 6, 6, 6))),
                              onPressed: () {},
                            ),
                            const SizedBox(width: 10),
                            ButtonWidget(
                              text: const Text('Bắp cải',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 4, 4, 4))),
                              onPressed: () {},
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            const SizedBox(width: 10),
                            ButtonWidget(
                              text: const Text('Cây bơ',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 7, 7, 7))),
                              onPressed: () {},
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            const SizedBox(width: 10),
                            DividerWidget(),
                            ButtonWidget(
                              text: Text('Clear All',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary)),
                              color: Theme.of(context).colorScheme.error,
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return DeleteDialog(
                                      onPressed: () {
                                        setState(() {
                                          _plantList.clear();
                                          _filteredPlantList.clear();
                                        });
                                      },
                                      title: 'Do you want to clear history?',
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(kDefaultBorderRaduis),
                        child: HistoryPlants(plantList: _filteredPlantList),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
