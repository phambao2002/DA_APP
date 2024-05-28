import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:app/pages/SignInPages.dart';
import 'package:app/pages/AccountPage.dart'; // Import trang AccountPage

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? _user;
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      setState(() {
        _user = user;
      });
    });
  }

  Future<void> _uploadImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hồ Sơ'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    AccountPage(), // Điều hướng đến trang AccountPage
              ),
            );
          },
        ),
      ),
      body: Center(
        child: _user != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: _imageFile != null
                        ? FileImage(_imageFile!)
                        : (_user!.photoURL != null
                            ? NetworkImage(_user!.photoURL!)
                            : AssetImage('assets/default_avatar.jpg')
                                as ImageProvider<Object>?),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: _uploadImage,
                    icon: Icon(Icons.camera_alt),
                    label: Text('Tải ảnh lên'),
                  ),
                  SizedBox(
                      height: 60), // Khoảng cách giữa ảnh và các phần còn lại
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Icon(Icons.person, color: Colors.blue),
                          SizedBox(width: 10),
                          Text(
                            'Name: ${_user!.displayName ?? 'Unknown'}',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Icon(Icons.email, color: Colors.blue),
                          SizedBox(width: 10),
                          Text('Email: ${_user!.email ?? 'Unknown'}'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Icon(Icons.phone, color: Colors.blue),
                          SizedBox(width: 10),
                          Text('Phone: ${_user!.phoneNumber ?? 'Unknown'}'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 90),
                  ElevatedButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInScreen(),
                        ),
                      );
                    },
                    child: Text('Đăng xuất'),
                  ),
                ],
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}
