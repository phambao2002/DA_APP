import 'package:flutter/material.dart';
import 'package:app/config/themes/theme.dart';
import 'package:app/services/disease_provider.dart';
import 'package:app/src/home_page/models/disease_model.dart';
import 'package:app/src/suggestions_page/suggestions.dart';
import 'package:provider/provider.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:app/services/classify.dart';
import 'package:app/services/hive_database.dart';
import 'package:iconsax/iconsax.dart';
import 'package:app/pages/accountPage.dart';
import 'package:app/pages/plantPage.dart';
import 'package:app/src/home_page/components/greeting.dart';
import 'package:app/src/home_page/components/history.dart';
import 'package:flutter/widgets.dart';
import 'package:app/src/home_page/components/titlesection.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_v2/tflite_v2.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  File? file;
  var _recognitions;
  var v = "";
  // var dataList = [];
  @override
  void initState() {
    super.initState();
    loadmodel().then((value) {
      setState(() {});
    });
  }

  loadmodel() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
    );
  }

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image = image;
        file = File(image!.path);
      });
      detectimage(file!);
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  Future detectimage(File image) async {
    int startTime = new DateTime.now().millisecondsSinceEpoch;
    var recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _recognitions = recognitions;
      v = recognitions.toString();
      // dataList = List<Map<String, dynamic>>.from(jsonDecode(v));
    });
    print("//////////////////////////////////////////////////");
    print(_recognitions);
    // print(dataList);
    print("//////////////////////////////////////////////////");
    int endTime = new DateTime.now().millisecondsSinceEpoch;
    print("Inference took ${endTime - startTime}ms");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter TFlite'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_image != null)
              Image.file(
                File(_image!.path),
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              )
            else
              Text('No image selected'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick Image from Gallery'),
            ),
            SizedBox(height: 20),
            Text(v),
          ],
        ),
      ),
    );
  }
}
