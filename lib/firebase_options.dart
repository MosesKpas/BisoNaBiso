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
    apiKey: 'AIzaSyB9XkIpLha8DtJ-Zj6IQVb1Ee-R8V5wDDw',
    appId: '1:574350818259:web:9db95f21a6a519b19b8d26',
    messagingSenderId: '574350818259',
    projectId: 'bisonabiso-88f14',
    authDomain: 'bisonabiso-88f14.firebaseapp.com',
    storageBucket: 'bisonabiso-88f14.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBvaZfiKL9HVFKm8cm96F40MxhRFTQiR2c',
    appId: '1:574350818259:android:04b1bd2331e2af569b8d26',
    messagingSenderId: '574350818259',
    projectId: 'bisonabiso-88f14',
    storageBucket: 'bisonabiso-88f14.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDoK-jb_kJfZQsqnQfLHUGgdcp1oGdfB54',
    appId: '1:574350818259:ios:829f4279017002fc9b8d26',
    messagingSenderId: '574350818259',
    projectId: 'bisonabiso-88f14',
    storageBucket: 'bisonabiso-88f14.appspot.com',
    iosBundleId: 'com.example.bisonabiso',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDoK-jb_kJfZQsqnQfLHUGgdcp1oGdfB54',
    appId: '1:574350818259:ios:829f4279017002fc9b8d26',
    messagingSenderId: '574350818259',
    projectId: 'bisonabiso-88f14',
    storageBucket: 'bisonabiso-88f14.appspot.com',
    iosBundleId: 'com.example.bisonabiso',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB9XkIpLha8DtJ-Zj6IQVb1Ee-R8V5wDDw',
    appId: '1:574350818259:web:44b10a4fa4718b6d9b8d26',
    messagingSenderId: '574350818259',
    projectId: 'bisonabiso-88f14',
    authDomain: 'bisonabiso-88f14.firebaseapp.com',
    storageBucket: 'bisonabiso-88f14.appspot.com',
  );
}
