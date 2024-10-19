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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBl1GciUyTF3fXUzVkQ4z4qQ3L2CsvQ1rM',
    appId: '1:319111783467:web:29af85d5df3cb1daa2f66e',
    messagingSenderId: '319111783467',
    projectId: 'flutter-animation-curves',
    authDomain: 'flutter-animation-curves.firebaseapp.com',
    storageBucket: 'flutter-animation-curves.appspot.com',
    measurementId: 'G-BV3DP8DE1T',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyACfDmIG7T-i9IeNNgAeP_rS0MzpsudpTo',
    appId: '1:319111783467:android:c1372837b8891ce0a2f66e',
    messagingSenderId: '319111783467',
    projectId: 'flutter-animation-curves',
    storageBucket: 'flutter-animation-curves.appspot.com',
  );
}
