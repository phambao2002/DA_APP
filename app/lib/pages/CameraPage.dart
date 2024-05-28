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
  // var _recognitions;
  String? _label;
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
      // numResults: 6,
      numResults: 1, // Only get the top result

      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    // setState(() {
    //   _recognitions = recognitions;
    //   v = recognitions.toString();
    // });
    setState(() {
      if (recognitions != null && recognitions.isNotEmpty) {
        _label = recognitions[0]['label']; // Extract label directly
        v = _label!; // Assign label to v for displaying
      } else {
        _label = 'No recognition';
        v = _label!;
      }
    });
    print("//////////////////////////////////////////////////");
    print(_label);
    print("//////////////////////////////////////////////////");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Xác nhận bệnh của cây'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (_image != null)
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green, width: 2),
                    borderRadius: BorderRadius.circular(15),
                  ),
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
              else
                Text(
                  'No image selected',
                  style: TextStyle(fontSize: 18),
                ),
              SizedBox(height: 20),
              Text(
                v,
                style: TextStyle(fontSize: 16, color: Colors.green),
                textAlign: TextAlign.center,
              ),
            ],
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
