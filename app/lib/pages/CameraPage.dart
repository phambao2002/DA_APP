import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_v2/tflite_v2.dart';
import 'dart:io';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  File? file;
  String? _label;
  String? _description;
  var v = "";

  @override
  void initState() {
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
  }

  Future<void> loadModel() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(source: source);
      setState(() {
        _image = image;
        if (image != null) {
          file = File(image.path);
          detectImage(file!);
        }
      });
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  Future<void> detectImage(File image) async {
    var recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 1, // Only get the top result
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      if (recognitions != null && recognitions.isNotEmpty) {
        _label = recognitions[0]['label'];
        v = _label!;
        _description = _getDescriptionFromLabel(_label!); // Get the description
      } else {
        _label = 'No recognition';
        v = _label!;
        _description = '';
      }
    });
    print("//////////////////////////////////////////////////");
    print(_label);
    print("//////////////////////////////////////////////////");
  }

  String _getDescriptionFromLabel(String label) {
    switch (label) {
      case "Bệnh ghẻ táo":
        return """Bệnh ghẻ táo là một bệnh nấm phổ biến ảnh hưởng đến cây táo và cây crabapple, do nấm Venturia inaequalis gây ra. Bệnh này thường biểu hiện qua các dấu hiệu sau:

Lá: Xuất hiện các vết đốm màu nâu hoặc đen, có thể làm lá rụng sớm.
Quả: Có các vết đốm tối màu, làm cho quả bị biến dạng và giảm chất lượng.
Cành non: Các vết nứt và đốm trên cành non có thể xuất hiện.
Bệnh ghẻ táo có thể làm giảm năng suất và chất lượng quả, gây thiệt hại kinh tế cho người trồng táo. Để kiểm soát bệnh, người trồng thường sử dụng các biện pháp như phun thuốc diệt nấm, chọn giống kháng bệnh, và thực hiện các biện pháp quản lý vườn hợp lý.""";
      case "Thối đen táo":
        return """Nguyên nhân: Nấm Botryosphaeria obtusa.
Triệu chứng: Xuất hiện các vết đen trên quả táo, lá và cành. Các vết trên quả thường có hình tròn và lan rộng, làm quả thối và rụng.
Kiểm soát: Sử dụng thuốc diệt nấm, cắt tỉa và tiêu hủy các bộ phận cây bị nhiễm bệnh.""";
      case "Rỉ sắt táo tuyết tùng":
        return """Nguyên nhân: Nấm Gymnosporangium juniperi-virginianae.
Triệu chứng: Các vết rỉ màu cam xuất hiện trên lá, quả và cành của cây táo; cây tuyết tùng là vật chủ trung gian.
Kiểm soát: Sử dụng giống cây kháng bệnh, phun thuốc diệt nấm, và loại bỏ các cây tuyết tùng gần cây táo.""";
      case "Táo khỏe mạnh":
        return """Đặc điểm: Lá xanh, không có dấu hiệu bệnh; quả mọng căng, không có vết thâm hay thối.
Bảo dưỡng: Cung cấp đủ nước và dinh dưỡng, cắt tỉa đúng cách và kiểm tra bệnh thường xuyên.""";
      case "Việt quất khỏe mạnh":
        return """Đặc điểm: Lá xanh, không có dấu hiệu bệnh; quả mọng căng, không có vết thâm hay thối.
Bảo dưỡng: Cung cấp đủ nước và dinh dưỡng, cắt tỉa đúng cách và kiểm tra bệnh thường xuyên.""";
      case "Đốm lá xám trên ngô":
        return """Nguyên nhân: Nấm Cercospora zeae-maydis.
Triệu chứng: Các vết đốm hình chữ nhật màu xám trên lá, có thể dẫn đến rụng lá sớm và giảm năng suất.
Kiểm soát: Sử dụng giống kháng bệnh, luân canh cây trồng, và phun thuốc diệt nấm.""";
      case "Rỉ sắt thông thường trên ngô":
        return """Nguyên nhân: Nấm Puccinia sorghi.
Triệu chứng: Các vết u màu cam hoặc đỏ trên lá, có thể lan rộng và gây rụng lá sớm.
Kiểm soát: Sử dụng giống kháng bệnh và phun thuốc diệt nấm khi cần.
""";
      case "Ngô khỏe mạnh":
        return """Đặc điểm: Lá xanh, không có vết đốm hoặc dấu hiệu bệnh; bắp ngô phát triển tốt, không bị mối mọt.
Bảo dưỡng: Cung cấp đủ nước và dinh dưỡng, kiểm tra bệnh thường xuyên, và thực hiện các biện pháp bảo vệ cây trồng.""";
      case "Bệnh đốm lá phương Bắc trên ngô":
        return """Nguyên nhân: Nấm Exserohilum turcicum.
Triệu chứng: Các vết đốm dài hình thoi màu xám hoặc nâu trên lá, có thể làm lá khô héo và chết sớm.
Kiểm soát: Sử dụng giống kháng bệnh, phun thuốc diệt nấm, và luân canh cây trồng.""";
      case "Anh đào khỏe mạnh, bao gồm cả anh đào chua":
        return """Đặc điểm: Lá xanh, không có dấu hiệu bệnh; quả anh đào mọng nước, không bị thối hoặc hỏng.
Bảo dưỡng: Cung cấp đủ nước và dinh dưỡng, cắt tỉa đúng cách và kiểm tra bệnh thường xuyên.""";
      case "Bệnh phấn trắng trên anh đào":
        return """Nguyên nhân: Nấm Podosphaera clandestina.
Triệu chứng: Lớp phấn trắng xuất hiện trên lá, hoa và quả; lá có thể biến dạng và rụng sớm.
Kiểm soát: Phun thuốc diệt nấm và cắt tỉa các bộ phận cây bị nhiễm bệnh.""";
      case "Thối đen nho":
        return """Nguyên nhân: Nấm Guignardia bidwellii.
Triệu chứng: Các vết đốm đen trên lá, cuống và quả; quả nho bị thối và rụng sớm.
Kiểm soát: Sử dụng thuốc diệt nấm, cắt tỉa và tiêu hủy các bộ phận cây bị nhiễm bệnh.""";
      case "Bệnh đốm đen nho)":
        return """Nguyên nhân: Một phức hợp các loại nấm, bao gồm Phaeomoniella chlamydospora và Phaeoacremonium aleophilum.
Triệu chứng: Các vết đốm đen trên lá và quả; quả bị khô và có thể nứt ra.
Kiểm soát: Phun thuốc diệt nấm và loại bỏ các bộ phận cây bị nhiễm bệnh.""";
      default:
        return "Không có thông tin bổ sung dữ liệu.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Xác nhận bệnh của cây'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                if (_image != null)
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green, width: 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    // child: ClipRRect(
                    //   borderRadius: BorderRadius.circular(15),
                    //   child: Image.file(
                    //     File(_image!.path),
                    //     height: 300,
                    //     width: double.infinity,
                    //     fit: BoxFit.cover,
                    //   ),
                    // ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.file(
                        File(_image!.path),
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                // else
                //   Container(
                //     decoration: BoxDecoration(
                //       border: Border.all(color: Colors.green, width: 2),
                //       borderRadius: BorderRadius.circular(15),
                //     ),
                //     child: ClipRRect(
                //       borderRadius: BorderRadius.circular(15),
                //       child: Image.asset(
                //         'assets/images/takePhoto.png', // Placeholder image when no image is selected
                //         height: 300,
                //         width: double.infinity,
                //         fit: BoxFit.cover,
                //       ),
                //     ),
                //   ),
                // SizedBox(height: 20),
                else
                  Image.asset(
                    'assets/images/takePhoto.png', // Placeholder image when no image is selected
                    height: 300,
                    width: 200,
                  ),
                SizedBox(height: 20),
                if (_label != null && _label != 'No recognition') ...[
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          // Text(
                          //   "Disease Detected",
                          //   style: TextStyle(
                          //       fontSize: 18,
                          //       fontWeight: FontWeight.bold,
                          //       color: Colors.green),
                          //   textAlign: TextAlign.center,
                          // ),
                          SizedBox(height: 10),
                          Text(
                            v,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Description",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              _description ?? '',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // ] else ...[
                  //   Text(
                  //     'No image selected',
                  //     style: TextStyle(fontSize: 18, color: Colors.red),
                  //     textAlign: TextAlign.center,
                  //   ),
                ]
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SpeedDial(
        icon: Icons.camera_alt,
        backgroundColor: Colors.green,
        spacing: 10,
        children: [
          SpeedDialChild(
            child: const FaIcon(
              Icons.image_search,
              color: Colors.white,
            ),
            label: "Gallery",
            backgroundColor: Colors.green,
            onTap: () => _pickImage(ImageSource.gallery),
          ),
          SpeedDialChild(
            child: const FaIcon(
              FontAwesomeIcons.camera,
              color: Colors.white,
            ),
            label: "Camera",
            backgroundColor: Colors.green,
            onTap: () => _pickImage(ImageSource.camera),
          ),
        ],
      ),
    );
  }
}
