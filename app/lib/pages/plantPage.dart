import 'package:flutter/material.dart';
import 'package:app/config/constants.dart';
import 'package:app/widgets/dialog.dart';
import 'package:app/widgets/divider.dart';
import 'package:app/widgets/widgets.dart';
import 'package:app/widgets/plantList.dart';
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
        species: 'Cây cam',
        condition: 'Bệnh ghẻ',
        date: DateTime(2024, 5, 20),
        description:
            'Bệnh sẹo là một trong các bệnh thường gặp ở cây cam thường phát triển trong  giai đoạn có lá, cành, quả còn non. ', // Thêm dấu phẩy ở cuối dòng này
        treatment: '''
        Biện pháp phòng, trừ bệnh ghẻ là bạn cần thiết kế hệ thống thoát nước tốt, không lựa chọn các giống cây chứa mầm bệnh. ''', // Thêm phần thông tin về cách chữa trị
      ),
      PlantView(
        imageUrl: 'assets/images/anh4.jpg',
        species: 'Cầy sầu riêng',
        condition: 'Cháy lá',
        date: DateTime(2024, 05, 16),
        description:
            '''Cây sầu siêng (tên khoa học: Dracaena fragrans) là một loại cây cảnh phổ biến được trồng trong nhà hoặc ngoài trời. ''', // Thêm dấu phẩy ở cuối dòng này

        treatment:
            '''Để chữa trị tình trạng lá cây sầu siêng bị cháy, bạn có thể thực hiện các biện pháp sau:''',
      ),
      PlantView(
        imageUrl: 'assets/images/anh5.jpg',
        species: 'Cây bưởi',
        condition: 'Vàng lá',
        date: DateTime(2024, 05, 15),
        description:
            '''Cây bưởi vàng (Citrus paradisi) là một loại cây thuộc họ cam, có nguồn gốc từ vùng nhiệt đới và cận nhiệt đới.''', // Thêm dấu phẩy ở cuối dòng này

        treatment:
            '''Để chữa trị tình trạng lá cây bưởi vàng bị bệnh hoặc ảnh hưởng bởi các vấn đề khác,''',
      ),
      PlantView(
        imageUrl: 'assets/images/anh6.jpg',
        species: 'Bắp cải',
        condition: 'Nấm',
        date: DateTime(2024, 05, 14),
        description:
            '''Khi bắp cải bị nhiễm nấm, thường xuất hiện các triệu chứng như lá và thân cây bắp cải bị nám hoặc bị phủ một lớp màu trắng, xám hoặc đen.''',
        treatment:
            '''Để chữa trị bệnh nấm trên cây bắp cải, có một số biện pháp bạn có thể thực hiện:''',
      ),
      PlantView(
        imageUrl: 'assets/images/anh7.jpg',
        species: 'Lá cải',
        condition: 'Bệnh đốm trắng',
        date: DateTime(2024, 05, 13),
        description:
            '''Khi lá cải bị bệnh đốm trắng, thường có những triệu chứng như sau:''', // Thêm dấu phẩy ở cuối dòng này

        treatment:
            '''Để chữa trị bệnh đốm trắng trên lá cải, bạn có thể thực hiện các biện pháp sau:''',
      ),
      PlantView(
        imageUrl: 'assets/images/anh8.jpg',
        species: 'Cây bơ',
        condition: 'Thối rễ',
        date: DateTime(2024, 05, 10),
        description:
            '''Khi cây bỏ bị thối rễ, thường xuất hiện những dấu hiệu và triệu chứng sau:
''', // Thêm dấu phẩy ở cuối dòng này

        treatment:
            'Để chữa trị cây bỏ bị thối rễ, bạn có thể thực hiện các biện pháp sau:',
      ),
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
              tabTexts: const ['Cây của tôi', 'Lịch sử'],
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
                                  hintText: 'Tìm kiếm...',
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
                            plantList: _filteredPlantList,
                            onTap: (selectedPlant) {
                              // In ra thông tin của cây được nhấn vào
                              print('Selected Plant:');
                              print('Image URL: ${selectedPlant.imageUrl}');
                              print('Species: ${selectedPlant.species}');
                              print('Condition: ${selectedPlant.condition}');
                              print('Date: ${selectedPlant.date}');
                              print(
                                  'description: ${selectedPlant.description}');
                              print('treatment: ${selectedPlant.treatment}');

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
                              text: Text('Xóa tất cả',
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
                                      title: 'Bạn có muốn xóa tất cả lịch sử',
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
