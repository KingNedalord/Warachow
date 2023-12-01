// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyA2iujqkj864mp6HtICWlndaIpN4xQgMg0',
    appId: '1:661116073445:web:1fa8a8d367a33ca5fceb0c',
    messagingSenderId: '661116073445',
    projectId: 'warachow-f4555',
    authDomain: 'warachow-f4555.firebaseapp.com',
    storageBucket: 'warachow-f4555.appspot.com',
    measurementId: 'G-RM5PT31VRN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB5XkLTToeVVSHHK3H1BdBoGHoRt5e9Ci4',
    appId: '1:661116073445:android:07a227b73af0bc7efceb0c',
    messagingSenderId: '661116073445',
    projectId: 'warachow-f4555',
    storageBucket: 'warachow-f4555.appspot.com',
  );
}