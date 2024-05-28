// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCDINZ6fHajfl5-UzzzoW_Ov0dZD7pExyI',
    appId: '1:417035115842:web:8e5e2d2a4dd837a6e6bcdb',
    messagingSenderId: '417035115842',
    projectId: 'project-doantotnghiep',
    authDomain: 'project-doantotnghiep.firebaseapp.com',
    storageBucket: 'project-doantotnghiep.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDWCC5nnZz6f8OGGGec647PsgztTGEcaG0',
    appId: '1:417035115842:android:0297c0d298f59a56e6bcdb',
    messagingSenderId: '417035115842',
    projectId: 'project-doantotnghiep',
    storageBucket: 'project-doantotnghiep.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCZ1KsEdj_nSw5V1xB2FShc5U3AAu-yKaQ',
    appId: '1:417035115842:ios:d9a614006cb98d3be6bcdb',
    messagingSenderId: '417035115842',
    projectId: 'project-doantotnghiep',
    storageBucket: 'project-doantotnghiep.appspot.com',
    iosBundleId: 'com.example.app',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCZ1KsEdj_nSw5V1xB2FShc5U3AAu-yKaQ',
    appId: '1:417035115842:ios:d9a614006cb98d3be6bcdb',
    messagingSenderId: '417035115842',
    projectId: 'project-doantotnghiep',
    storageBucket: 'project-doantotnghiep.appspot.com',
    iosBundleId: 'com.example.app',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCDINZ6fHajfl5-UzzzoW_Ov0dZD7pExyI',
    appId: '1:417035115842:web:ba8cae122d794a21e6bcdb',
    messagingSenderId: '417035115842',
    projectId: 'project-doantotnghiep',
    authDomain: 'project-doantotnghiep.firebaseapp.com',
    storageBucket: 'project-doantotnghiep.appspot.com',
  );
}
