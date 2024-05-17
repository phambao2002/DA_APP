import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:app/config/constants.dart';
import 'package:app/widgets/dialog.dart';
import 'package:app/widgets/divider.dart';
import 'package:app/widgets/widgets.dart';

class CustomTabBar extends StatelessWidget {
  final TabController tabController;
  final List<String> tabTexts;
  final Color labelColor;
  final Color unselectedLabelColor;
  final Color indicatorColor;

  CustomTabBar({
    required this.tabController,
    required this.tabTexts,
    this.labelColor = Colors.black, // Default label color
    this.unselectedLabelColor = Colors.grey, // Default unselected label color
    this.indicatorColor = Colors.blue, // Default indicator color
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

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<PlantView> _plantList = [
      PlantView(
          imageUrl: 'assets/images/anh3.jpg',
          species: 'Vết đốm trên lá',
          condition: 'Bị đốm lá ',
          date: DateTime(2024, 5, 20)),
      PlantView(
          imageUrl: 'assets/images/anh4.jpg',
          species: 'Cây sầu riêng',
          condition: 'Cháy lá ',
          date: DateTime(2024, 05, 16)),
      PlantView(
          imageUrl: 'assets/images/anh5.jpg',
          species: 'Cây bưởi',
          condition: 'Vàng lá ',
          date: DateTime(2024, 05, 15)),
      PlantView(
          imageUrl: 'assets/images/anh6.jpg',
          species: 'Bắp cải ',
          condition: 'Nấm Alternaria brassicae ',
          date: DateTime(2024, 05, 14)),
      PlantView(
          imageUrl: 'assets/images/anh7.jpg',
          species: 'Lá cải ',
          condition: 'Bệnh đốm trắng',
          date: DateTime(2024, 05, 13)),
      PlantView(
          imageUrl: 'assets/images/anh8.jpg',
          species: 'Cây bơ',
          condition: 'Thối rễ',
          date: DateTime(2024, 05, 10)),
    ];

    return Container(
      padding:
          EdgeInsets.only(top: kDefaultPadding, bottom: kDefaultPadding / 2),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
            child: CustomTabBar(
              tabController: _tabController,
              tabTexts: ['My Plants', 'History'],
              labelColor: Colors.green, // Customize label color
              unselectedLabelColor:
                  Colors.red, // Customize unselected label color
              indicatorColor: Colors.blue, // Customize indicator color
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
                  child: Column(
                    children: [
                      Container(
                        height: 54,
                        margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
                        child: Row(
                          children: [
                            Expanded(
                              child: SearchBar(),
                            ),
                            SizedBox(width: 20),
                            SortMenuBox(
                              options: [
                                SortItem(text: 'Date'),
                                SortItem(text: 'Alphabet')
                              ],
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(kDefaultBorderRaduis),
                          child: MyPlants(plantList: _plantList),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
                  child: Column(
                    children: [
                      Container(
                        height: 54,
                        margin: EdgeInsets.only(top: kDefaultPadding),
                        child: Row(
                          children: [
                            Expanded(
                              child: SearchBar(),
                            ),
                            SizedBox(width: 20),
                            SortMenuBox(
                              options: [
                                SortItem(text: 'Latest'),
                                SortItem(text: 'Oldest')
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 34,
                        margin:
                            EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(kDefaultBorderRaduis),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              ButtonWidget(
                                text: Text('Cây sầu riêng',
                                    style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 6, 6, 6))),
                                onPressed: () {},
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              SizedBox(width: 10),
                              ButtonWidget(
                                text: Text('Bắp cải',
                                    style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 4, 4, 4))),
                                onPressed: () {},
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              SizedBox(width: 10),
                              ButtonWidget(
                                text: Text('Cây bơ',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 7, 7, 7))),
                                onPressed: () {},
                                color: Theme.of(context).colorScheme.secondary,
                              ),
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
                                          _plantList.clear();
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
                          child: HistoryPlants(plantList: _plantList),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
//           imageUrl: 'assets/images/anh3.jpg',
//           species: 'Vết đốm trên lá',
//           condition: 'Bị đốm lá ',
//           date: DateTime(2024, 5, 20)),
//       PlantView(
//           imageUrl: 'assets/images/anh4.jpg',
//           species: 'Cây sầu riêng',
//           condition: 'Cháy lá ',
//           date: DateTime(2024, 05, 16)),
//       PlantView(
//           imageUrl: 'assets/images/anh5.jpg',
//           species: 'Cây bưởi',
//           condition: 'Vàng lá ',
//           date: DateTime(2024, 05, 15)),
//       PlantView(
//           imageUrl: 'assets/images/anh6.jpg',
//           species: 'Bắp cải ',
//           condition: 'Nấm Alternaria brassicae ',
//           date: DateTime(2024, 05, 14)),
//       PlantView(
//           imageUrl: 'assets/images/anh7.jpg',
//           species: 'Lá cải ',
//           condition: 'Bệnh đốm trắng',
//           date: DateTime(2024, 05, 13)),
//       PlantView(
//           imageUrl: 'assets/images/anh8.jpg',
//           species: 'Cây bơ',
//           condition: 'Thối rễ',
//           date: DateTime(2024, 05, 10)),
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
//             labelColor: Colors.green, 
//             unselectedLabelColor: Colors.red, 
//             ndicatorColor: Colors.blue,
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
//                   Expanded(
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(kDefaultBorderRaduis),
//                       child: MyPlants(plantList: _plantList),
//                     ),
//                   ),
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
//                                 text: Text('Cây sầu riêng',
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
//                                 text: Text('Bắp cải',
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
//                                 text: Text('Cây bơ',
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
