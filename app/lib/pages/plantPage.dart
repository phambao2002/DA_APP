import 'package:flutter/material.dart';
import 'package:app/config/constants.dart';
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
            '- Bệnh sẹo là một trong các bệnh thường gặp ở cây cam thường phát triển trong  giai đoạn có lá, cành, quả còn non. Kèm theo đó, nhiệt độ với độ ẩm cao và dao động ở mức 20 – 23 độ C. ',
        treatment: '''
 - Biện pháp phòng, trừ bệnh ghẻ là bạn cần thiết kế hệ thống thoát nước tốt, không lựa chọn các giống cây chứa mầm bệnh. Bạn cần đảm bảo trồng cây với mật độ hợp lý và không nên quá dày để vườn cây được thông thoáng.
 - Bạn cần thường xuyên cắt và thu gom cành, lá, quả bị bệnh để tiêu hủy nguồn bệnh. Với những cây bị bệnh thì bạn không được tưới nước lên tán cây vào buổi chiều mát và không tưới thừa nước. Theo định kỳ thì bạn nên tỉa tán và tránh tạo vết thương cơ giới cho vi khuẩn xâm nhập.
 - Lưu ý bón thêm phân cân đối NPK và tăng cường bón thêm phân kali cho vườn cây đang bị bệnh ghẻ sẹo. Bạn có thể phun thuốc phòng trừ bệnh bằng các hoạt chất sau đây để ức chế sự lây lan của mầm bệnh.
 - Bosix Defen Pro
    + Tittus Super 300EC: pha 10ml thuốc/ bình 16
    + 18 lít nước và phun 800
    + 1200 lít nước/ ha.
 - FUJIVIL 360SC
    + 100ml: pha 240ml thuốc/ 300
    + 400 lít nước và phun 800
    + 1200 lít nước/ ha.
      ''',
      ),
      PlantView(
        imageUrl: 'assets/images/anh4.jpg',
        species: 'Cầy sầu riêng',
        condition: 'Cháy lá',
        date: DateTime(2024, 05, 16),
        description:
            '''Cây sầu siêng (tên khoa học: Dracaena fragrans) là một loại cây cảnh phổ biến được trồng trong nhà hoặc ngoài trời. Đặc điểm chung của cây này là thân cây thẳng đứng, lá mảnh và màu xanh đậm. Tuy nhiên, nếu lá cây sầu siêng bắt đầu cháy và khô, có thể có một số nguyên nhân sau:
  - Ánh sáng mặt trời quá mạnh: Cây sầu siêng thích ánh sáng yếu hoặc ánh sáng mặt trời gián đoạn. Nếu đặt cây dưới ánh sáng mặt trời trực tiếp quá lâu, lá có thể cháy và khô.
  - Tưới nước không đủ hoặc quá nhiều: Cây sầu siêng cần đủ nước để duy trì sự tươi tắn của lá. Việc tưới nước không đều, hoặc tưới quá nhiều nước có thể gây ra sự cháy lá.
  - Không gian trồng hẹp: Nếu cây sầu siêng được trồng trong chậu nhỏ hoặc không có không gian để phát triển, lá có thể cháy do thiếu không khí và không gian.
  - Độ ẩm thấp: Cây sầu siêng cần độ ẩm cao để lá phát triển mạnh mẽ. Nếu không đủ độ ẩm trong môi trường, lá có thể cháy và khô.
  - Chất đất không phù hợp: Chất đất không tốt hoặc không thoát nước tốt có thể gây ra sự cháy lá do cây không thể hấp thụ đủ nước.
  - Để giữ cho cây sầu siêng khỏe mạnh và tránh sự cháy lá, bạn cần đảm bảo cung cấp đủ ánh sáng, nước và độ ẩm phù hợp, đồng thời đặt cây ở một vị trí có không gian đủ để phát triển. Đảm bảo rằng đất cây có đủ thoát nước và đặt cây ra khỏi ánh nắng mặt trời trực tiếp trong những giờ nắng gắt.''', // Thêm dấu phẩy ở cuối dòng này

        treatment:
            '''Cây sầu riêng bị cháy lá có thể do nhiều nguyên nhân như bệnh do nấm, vi khuẩn, côn trùng gây hại, hoặc điều kiện môi trường không thuận lợi. Dưới đây là các biện pháp chữa trị và phòng ngừa khi cây sầu riêng bị cháy lá:

1. Nguyên nhân và cách chữa trị cháy lá do bệnh
Bệnh cháy lá do nấm
Triệu chứng: Lá xuất hiện các vết cháy, thường bắt đầu từ mép lá và lan rộng vào bên trong, lá có thể khô và rụng.
Nguyên nhân: Do nấm Phytophthora, Pythium hoặc Colletotrichum.
Cách chữa trị:
Phun thuốc trừ nấm: Sử dụng các loại thuốc như Mancozeb, Copper oxychloride, hoặc Metalaxyl. Phun theo hướng dẫn của nhà sản xuất.
Cắt tỉa lá bị bệnh: Ngắt bỏ và tiêu hủy các lá bị bệnh để tránh lây lan.
Bệnh cháy lá do vi khuẩn
Triệu chứng: Lá có các vết cháy, nước, hoặc các vết ướt mờ, sau đó khô và cháy.
Nguyên nhân: Do vi khuẩn Xanthomonas hoặc Pseudomonas.
Cách chữa trị:
Phun thuốc trừ khuẩn: Sử dụng các loại thuốc chứa Copper hydroxide hoặc Streptomycin theo hướng dẫn của nhà sản xuất.
Cắt tỉa và tiêu hủy lá bị bệnh: Đảm bảo cây luôn được thông thoáng.
2. Nguyên nhân và cách chữa trị cháy lá do côn trùng
Triệu chứng: Lá bị cháy do côn trùng chích hút, gây ra các vết đốm cháy và mất màu.
Cách chữa trị:
Phun thuốc trừ sâu: Sử dụng các loại thuốc trừ sâu như Imidacloprid, Abamectin hoặc Permethrin theo hướng dẫn của nhà sản xuất.
Kiểm tra và loại bỏ côn trùng: Thường xuyên kiểm tra cây và loại bỏ các côn trùng gây hại.
3. Điều kiện môi trường và cách phòng ngừa
Tưới nước và độ ẩm
Tưới nước đúng cách: Tránh tưới quá nhiều nước gây ngập úng hoặc quá ít nước làm cây khô hạn. Tưới vào buổi sáng sớm để lá cây khô nhanh, giảm nguy cơ nhiễm bệnh.
Đảm bảo thoát nước tốt: Đảm bảo đất thoát nước tốt để tránh tình trạng ngập úng.
Ánh sáng và gió
Đảm bảo ánh sáng đầy đủ: Cây sầu riêng cần đủ ánh sáng mặt trời, nhưng tránh ánh nắng gắt trực tiếp trong thời gian dài.
Tạo điều kiện thoáng gió: Trồng cây ở nơi có gió lưu thông tốt để giảm độ ẩm xung quanh cây.
4. Chăm sóc và bón phân
Bón phân hợp lý
Cân đối dinh dưỡng: Bón phân cân đối giữa đạm, lân, kali và các vi lượng khác để cây phát triển khỏe mạnh.
Sử dụng phân hữu cơ: Bón phân hữu cơ để cải thiện đất và tăng cường sức đề kháng cho cây.
Cắt tỉa cây
Cắt tỉa hợp lý: Loại bỏ các cành lá bị nhiễm bệnh và cắt tỉa để cây thông thoáng, giảm nguy cơ bị bệnh.
5. Sử dụng giống kháng bệnh
Chọn giống khỏe mạnh: Sử dụng các giống sầu riêng có khả năng kháng bệnh tốt.
Việc kết hợp các biện pháp trên sẽ giúp kiểm soát và phòng ngừa hiệu quả hiện tượng cháy lá trên cây sầu riêng. Nếu tình trạng cháy lá vẫn diễn ra phức tạp và khó kiểm soát, nên tìm đến sự tư vấn của chuyên gia nông nghiệp để có giải pháp cụ thể và hiệu quả.''',
      ),
      PlantView(
        imageUrl: 'assets/images/anh5.jpg',
        species: 'Cây bưởi',
        condition: 'Vàng lá',
        date: DateTime(2024, 05, 15),
        description:
            '''Cây bưởi vàng (Citrus paradisi) là một loại cây thuộc họ cam, có nguồn gốc từ vùng nhiệt đới và cận nhiệt đới. Dưới đây là mô tả về lá của cây bưởi vàng:
  - Hình dạng: Lá của cây bưởi vàng có hình dạng hình bầu dục hoặc hình bầu dục hơi dài, với phần đỉnh nhọn và phần gốc tròn hoặc hơi hình trái xoan.
  - Kích thước: Lá thường có kích thước trung bình đến lớn, tùy thuộc vào độ tuổi của cây và điều kiện môi trường. Cây trưởng thành thường có lá lớn hơn so với cây non.
  - Bề mặt và màu sắc: Bề mặt của lá thường mịn và nhẵn, có thể có một số rãnh nhỏ. Màu sắc của lá thường là màu xanh đậm đến màu xanh nhạt, tùy thuộc vào loại giống và điều kiện trồng.
  - Cấu trúc ven lá: Lá của cây bưởi vàng có cấu trúc ven đơn, nghĩa là có một dãy các gân lá chạy từ phần gốc đến phần đỉnh của lá.
  - Mùi hương: Lá của cây bưởi vàng thường mang một mùi hương dễ chịu, nhẹ nhàng, đặc trưng của loài cây.
  - Tính chất: Lá của cây bưởi vàng thường rất thơm và có thể được sử dụng để làm gia vị trong nấu ăn hoặc làm thức uống.
  - Cây bưởi vàng không chỉ được trồng để thu hoạch trái ngon, mà cả lá của nó cũng có giá trị thẩm mỹ và sử dụng trong các ứng dụng khác nhau, như nấu ăn, làm gia vị, hay trong y học dân gian.''', // Thêm dấu phẩy ở cuối dòng này

        treatment:
            '''Cây bưởi vàng (Citrus paradisi) có thể gặp nhiều loại bệnh và côn trùng gây hại. Dưới đây là một số bệnh phổ biến và cách trị:

1. Bệnh vàng lá gân xanh (Greening)
Triệu chứng: Lá bưởi vàng không đều, gân lá vẫn xanh, quả nhỏ, biến dạng và dễ rụng.
Nguyên nhân: Do vi khuẩn Liberibacter asiaticus lây truyền qua côn trùng chích hút (rầy chổng cánh).
Cách trị:
Phòng ngừa: Sử dụng giống cây sạch bệnh, trồng cây ở nơi thoáng mát, không quá ẩm ướt.
Kiểm soát rầy chổng cánh: Phun thuốc bảo vệ thực vật như Imidacloprid, Thiamethoxam theo hướng dẫn của nhà sản xuất.
Tiêu hủy cây bệnh: Nếu cây bị nhiễm bệnh nặng, cần tiêu hủy cây để tránh lây lan.
2. Bệnh thán thư (Anthracnose)
Triệu chứng: Lá, cành, và quả bưởi xuất hiện các đốm nâu đen, lan rộng và làm thối quả.
Nguyên nhân: Do nấm Colletotrichum gloeosporioides.
Cách trị:
Ngắt bỏ phần bị bệnh: Cắt tỉa và tiêu hủy các cành, lá và quả bị bệnh.
Phun thuốc trừ nấm: Sử dụng thuốc chứa hoạt chất Mancozeb hoặc Chlorothalonil.
3. Bệnh nứt thân chảy nhựa (Gummosis)
Triệu chứng: Thân và cành cây bị nứt, chảy nhựa, lá vàng và rụng.
Nguyên nhân: Do nấm Phytophthora spp.
Cách trị:
Cắt bỏ phần bị bệnh: Cắt bỏ phần thân, cành bị nứt và chảy nhựa, bôi thuốc bảo vệ thực vật chứa Copper oxychloride lên vết cắt.
Phun thuốc trừ nấm: Sử dụng thuốc Metalaxyl hoặc Fosetyl-Al để phun cho cây theo hướng dẫn.
4. Sâu bệnh hại
Rệp sáp: Rệp sáp bám vào cành, lá và quả, hút nhựa và gây hại cho cây.
Cách trị: Phun thuốc trừ sâu như Imidacloprid hoặc Buprofezin.
Sâu đục thân: Sâu đục vào thân cây, gây hại nghiêm trọng.
Cách trị: Tiêm thuốc trừ sâu trực tiếp vào lỗ đục, sử dụng thuốc Cypermethrin.
5. Cải thiện điều kiện môi trường
Đảm bảo thông thoáng: Trồng cây với khoảng cách hợp lý để cây có đủ không gian phát triển.
Tưới nước đúng cách: Tránh tưới nước quá nhiều, duy trì độ ẩm vừa phải cho cây.
6. Bón phân hợp lý
Cân đối dinh dưỡng: Bón phân cân đối giữa đạm, lân, kali và các vi lượng khác để cây phát triển khỏe mạnh.
Phân hữu cơ: Sử dụng phân hữu cơ để cải thiện đất và tăng cường sức đề kháng cho cây.
7. Sử dụng giống kháng bệnh
Chọn giống khỏe mạnh: Sử dụng các giống bưởi có khả năng kháng bệnh tốt.
Việc kết hợp các biện pháp trên sẽ giúp kiểm soát và phòng ngừa hiệu quả các bệnh hại trên cây bưởi vàng. Nếu bệnh tình diễn biến phức tạp và khó kiểm soát, nên tìm đến sự tư vấn của chuyên gia nông nghiệp để có giải pháp cụ thể.''',
      ),
      PlantView(
        imageUrl: 'assets/images/anh6.jpg',
        species: 'Bắp cải',
        condition: 'Nấm',
        date: DateTime(2024, 05, 14),
        description:
            '''Khi bắp cải bị nhiễm nấm, thường xuất hiện các triệu chứng như lá và thân cây bắp cải bị nám hoặc bị phủ một lớp màu trắng, xám hoặc đen. Các triệu chứng này thường là dấu hiệu của một loạt các bệnh nấm, như nấm phủ, nấm lá, hoặc nấm đất. Dưới đây là mô tả chi tiết về các triệu chứng và biện pháp chữa trị:
  - Lá bắp cải bị nấm: Các lá bắp cải bị nhiễm nấm thường sẽ có các vết nám, đốm hoặc phủ một lớp mảng nấm màu trắng, xám hoặc đen. Các vết này thường lan rộng từ lá già đến lá non và có thể làm hỏng hoặc làm chết toàn bộ lá.
  - Thân cây bắp cải bị nấm: Thân cây bắp cải cũng có thể bị nhiễm nấm, thường thể hiện qua các vết nám, đốm hoặc phủ một lớp mảng nấm màu trắng, xám hoặc đen. Nếu nấm tấn công mạnh, có thể gây ra sự suy yếu của thân cây và ảnh hưởng đến sự phát triển của cây.
  - Ảnh hưởng đến trái: Nếu cây bắp cải bị nấm ở giai đoạn ra hoa và đậu trái, nấm cũng có thể ảnh hưởng đến trái bằng cách gây ra các vết nám, thối rữa hoặc làm hỏng hoặc làm chết trái.
  - Để chữa trị bệnh nấm trên cây bắp cải, bạn có thể thực hiện các biện pháp sau:
  - Loại bỏ các phần bị nhiễm nấm: Cắt bỏ các phần của cây bắp cải bị nhiễm nấm để ngăn chặn sự lây lan của bệnh. Đảm bảo sát trùng các dụng cụ cắt để tránh lây lan bệnh sang các phần khác của cây.
  - Sử dụng thuốc trừ nấm: Sử dụng thuốc trừ nấm phòng trừ hoặc điều trị bệnh theo hướng dẫn của nhà nông hoặc chuyên gia về cây trồng.
  - Cải thiện thoát nước: Đảm bảo rằng cây bắp cải không bị ướt đến mức dễ dàng nhiễm nấm. Cải thiện thoát nước bằng cách tránh tưới nước vào lá và cung cấp hệ thống thoát nước tốt cho vườn.
  - Chăm sóc cây tốt: Đảm bảo rằng cây bắp cải đang ở trong môi trường phù hợp với sự phát triển của nó. Cung cấp đủ ánh sáng, không gian và dinh dưỡng để giúp cây củng cố hệ thống miễn dịch và chống lại các bệnh tật.
  - Quản lý vườn: Thực hiện các biện pháp quản lý vườn như quản lý cánh rừng, kiểm soát côn trùng, và làm sạch các vật liệu thừa để giảm thiểu điều kiện thuận lợi cho sự phát triển của nấm.''', // Thêm dấu phẩy ở cuối dòng này

        treatment:
            '''Khi cải bị nhiễm nấm, bạn có thể áp dụng các biện pháp sau để chữa trị và kiểm soát bệnh:

1. Ngắt bỏ lá bị bệnh:
Ngay khi phát hiện lá cải bị nhiễm nấm, ngắt bỏ và tiêu hủy những lá này để ngăn ngừa lây lan sang các cây khác.
2. Sử dụng thuốc bảo vệ thực vật:
Thuốc hóa học:
Sử dụng các loại thuốc diệt nấm phổ biến như Mancozeb, Chlorothalonil, Copper hydroxide, hay Propiconazole. Phun thuốc theo hướng dẫn của nhà sản xuất về liều lượng và cách sử dụng.
Thuốc sinh học:
Sử dụng các chế phẩm sinh học như Trichoderma hoặc Bacillus subtilis để kiểm soát nấm gây bệnh.
3. Phun thuốc sinh học:
Các chế phẩm sinh học như nấm đối kháng Trichoderma có thể được sử dụng để kiểm soát các loại nấm gây bệnh trên cải.
4. Cải thiện điều kiện môi trường:
Đảm bảo thông thoáng:
Trồng cây cải với mật độ hợp lý để cây có đủ không gian phát triển và giảm độ ẩm xung quanh cây.
Tưới nước đúng cách:
Tưới nước vào buổi sáng sớm để lá cây khô nhanh hơn trong ngày, giảm thiểu điều kiện ẩm ướt thuận lợi cho nấm phát triển.
5. Luân canh cây trồng:
Luân canh cây trồng:
Tránh trồng liên tiếp các cây cùng họ Cải trên một mảnh đất để giảm sự tích tụ của nấm trong đất.
Trồng cây xen canh:
Trồng xen các loại cây không phải họ Cải để giảm nguy cơ lây lan bệnh nấm.
6. Bón phân hợp lý:
Cân đối dinh dưỡng:
Bón phân cân đối giữa các loại phân đạm, lân, và kali để cây phát triển khỏe mạnh, tăng sức đề kháng chống lại bệnh tật.
Tránh bón quá nhiều đạm:
Bón quá nhiều đạm có thể làm cây mềm yếu và dễ bị nấm tấn công.
7. Sử dụng giống kháng bệnh:
Chọn giống kháng bệnh:
Chọn các giống cải có khả năng kháng bệnh nấm cao, nếu có sẵn.
8. Kiểm tra và theo dõi thường xuyên:
Giám sát cây trồng:
Thường xuyên kiểm tra tình trạng cây trồng để phát hiện sớm các dấu hiệu bệnh và có biện pháp xử lý kịp thời.
Bằng cách kết hợp các biện pháp trên, bạn có thể kiểm soát và phòng ngừa hiệu quả bệnh nấm trên cây cải. Nếu bệnh nấm phát triển nặng và khó kiểm soát, nên tìm đến sự tư vấn của chuyên gia nông nghiệp để có giải pháp tối ưu.''',
      ),
      PlantView(
        imageUrl: 'assets/images/anh7.jpg',
        species: 'Lá cải',
        condition: 'Bệnh đốm trắng',
        date: DateTime(2024, 05, 13),
        description:
            '''Khi lá cải bị bệnh đốm trắng, thường có những triệu chứng như sau:
  - Đốm màu trắng trên lá: Lá cải có thể xuất hiện các vết đốm màu trắng không đều, thường xuất hiện ở mặt trên hoặc dưới của lá.
  - Kích thước và hình dạng đa dạng: Các vết đốm có thể có kích thước và hình dạng khác nhau, từ nhỏ đến lớn, từ tròn đến hình bất đối xứng.
  - Biên giới rõ ràng: Biên giới giữa vùng bị ảnh hưởng và vùng không bị ảnh hưởng thường rõ ràng và sắc nét.
  - Lá bị héo, mất màu: Các lá bị nhiễm bệnh có thể bị héo, khô, hoặc mất màu dần theo thời gian.
  - Giảm chất lượng sản phẩm: Bệnh đốm trắng có thể làm giảm chất lượng của cây cải, ảnh hưởng đến giá trị thương mại của nó.
  - Để chữa trị bệnh đốm trắng trên lá cải, bạn có thể thực hiện các biện pháp sau:
  - Loại bỏ lá bị nhiễm bệnh: Cắt bỏ hoặc thu hoạch các lá bị nhiễm bệnh và tiêu hủy chúng để ngăn chặn sự lây lan của bệnh.
  - Sử dụng thuốc phòng trừ: Sử dụng các loại thuốc phòng trừ nấm được phát triển đặc biệt để chống lại bệnh đốm trắng. Hãy sử dụng theo hướng dẫn của nhà sản xuất và tuân thủ các biện pháp an toàn.
  - Tăng cường hệ thống miễn dịch của cây: Cung cấp đủ dinh dưỡng cho cây cải để tăng cường hệ thống miễn dịch tự nhiên của nó, giúp cây chống lại bệnh tật.
  - Quản lý môi trường: Giảm thiểu ẩm ướt và cung cấp thông gió tốt để làm giảm điều kiện lý tưởng cho sự phát triển của nấm.
  - Quản lý vườn: Thực hiện các biện pháp quản lý vườn như kiểm soát côn trùng và cỏ dại để giảm sự lây lan của bệnh.''', // Thêm dấu phẩy ở cuối dòng này

        treatment:
            '''Bệnh đốm trắng trên cải (cải thảo, cải ngọt, cải bẹ xanh,...) là do nấm hoặc vi khuẩn gây ra. Để chữa trị bệnh này, bạn có thể áp dụng các biện pháp sau:

- Ngắt bỏ lá bị bệnh:
Ngay khi phát hiện lá có đốm trắng, bạn nên ngắt bỏ và tiêu hủy những lá này để tránh lây lan.
- Sử dụng thuốc bảo vệ thực vật:
Sử dụng các loại thuốc bảo vệ thực vật chứa các hoạt chất như Mancozeb, Chlorothalonil, Copper hydroxide, hay các loại thuốc có nguồn gốc sinh học để kiểm soát nấm và vi khuẩn.
Tuân theo hướng dẫn của nhà sản xuất về liều lượng và cách phun thuốc để đạt hiệu quả cao nhất và đảm bảo an toàn.
- Phun thuốc sinh học:
Sử dụng các chế phẩm sinh học như Trichoderma hoặc Bacillus subtilis để kiểm soát nấm và vi khuẩn gây bệnh.
- Cải thiện điều kiện môi trường:
Đảm bảo cây trồng được thông thoáng, không trồng quá dày.
Tưới nước vào buổi sáng sớm để lá cây có thể khô nhanh trong ngày.
Giảm độ ẩm trong vườn, hạn chế tưới nước lên lá cây vào buổi chiều hoặc tối.
- Luân canh cây trồng:
Luân canh với các loại cây không thuộc họ Cải để giảm bớt mầm bệnh trong đất.
- Bón phân hợp lý:
Bón phân cân đối và hợp lý, tránh bón quá nhiều đạm vì có thể làm cây mềm yếu và dễ bị bệnh hơn.
- Sử dụng giống kháng bệnh:
Chọn giống cải có khả năng kháng bệnh đốm trắng nếu có sẵn.
Bằng cách áp dụng các biện pháp trên, bạn có thể kiểm soát và phòng ngừa hiệu quả bệnh đốm trắng trên cây cải. Nếu bệnh phát triển nặng và khó kiểm soát, nên tìm đến sự tư vấn của chuyên gia nông nghiệp để có giải pháp tối ưu.''',
      ),
      PlantView(
        imageUrl: 'assets/images/anh8.jpg',
        species: 'Cây bơ',
        condition: 'Thối rễ',
        date: DateTime(2024, 05, 10),
        description:
            '''Khi cây bỏ bị thối rễ, thường xuất hiện những dấu hiệu và triệu chứng sau:
  - Lá và cành héo, nhạt màu: Lá của cây có thể trở nên héo, mất màu và dễ rụng.
  - Cành có thể mất sức sống và không còn sinh sôi.
  - Mùi hôi từ gốc: Một trong những dấu hiệu tiêu biểu của thối rễ là mùi hôi khó chịu phát ra từ khu vực gốc của cây. Điều này thường là dấu hiệu của vi khuẩn hoặc nấm gây ra sự phân huỷ của rễ.
  - Rễ mềm, đen, và mục: Rễ bị nhiễm bệnh có thể trở nên mềm, đen, và có dấu hiệu của sự phân huỷ. Chúng có thể dễ dàng bị bong tróc hoặc bị gãy.
  - Sự giảm trưởng: Cây bỏ bị thối rễ thường có sự giảm trưởng chậm chạp hoặc không có sự phát triển mới. Cây có thể bị suy yếu và dần dần chết đi.
  - Thành phần chất đất: Thối rễ thường xảy ra trong các môi trường chất đất ẩm ướt và thiếu thông thoáng, nơi nấm và vi khuẩn có thể phát triển mạnh mẽ.''',
        treatment:
            '''Để chữa trị cây bỏ bị thối rễ, bạn có thể thực hiện các biện pháp sau:
  - Loại bỏ phần rễ bị nhiễm bệnh: Cắt bỏ các phần rễ bị thối và mục, đảm bảo cắt vùng sức khỏe và sử dụng dụng cụ cắt sắc để tránh lây lan bệnh.
  - Chuyển cây sang chậu mới và chất đất mới: Đối với cây bỏ bị thối rễ nặng, có thể cần chuyển cây sang chậu mới với chất đất mới, thoáng khí và thoát nước tốt hơn.
  - Kiểm soát độ ẩm: Đảm bảo rằng cây được tưới nước một cách đều đặn và không bị ngập nước. Kiểm soát độ ẩm trong chậu hoặc vườn là quan trọng để ngăn chặn tái phát của bệnh
  - Sử dụng phân bón hữu cơ: Sử dụng phân bón hữu cơ để cung cấp dinh dưỡng cho cây một cách tự nhiên và hỗ trợ hệ thống miễn dịch của cây.
  - Xử lý chất đất: Kiểm tra chất đất để đảm bảo nó có đủ thoáng khí và thoát nước. Loại bỏ chất đất bị nhiễm bệnh và thay thế bằng chất đất mới và sạch sẽ.
  Nhớ rằng việc phòng tránh bệnh quan trọng hơn việc chữa trị. Đảm bảo rằng cây được trồng trong môi trường lý tưởng và có hệ thống chăm sóc đúng đắn để ngăn chặn sự phát triển của bệnh.''',
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
                              print('Loài: ${selectedPlant.species}');
                              print('Tình trạng: ${selectedPlant.condition}');
                              print('Ngày cập nhật : ${selectedPlant.date}');
                              print('Miêu tả : ${selectedPlant.description}');
                              print('Cách chữ trị: ${selectedPlant.treatment}');

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
                Container(
                  child: Center(
                    child: Text(
                      'Không có lịch sử',
                      style: TextStyle(fontSize: 18),
                    ),
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
