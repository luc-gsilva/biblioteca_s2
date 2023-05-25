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
    apiKey: 'AIzaSyAGlpseoXh8z8wVzomazZWn_24ILhymtWU',
    appId: '1:174158602420:web:3c1dff93e51c36eac5f7e1',
    messagingSenderId: '174158602420',
    projectId: 'biblioteca-s',
    authDomain: 'biblioteca-s.firebaseapp.com',
    databaseURL: 'https://biblioteca-s-default-rtdb.firebaseio.com',
    storageBucket: 'biblioteca-s.appspot.com',
    measurementId: 'G-LZX05TSJSX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCt1zpF2_YtQQXDW5JPBoL-rDJvwLUl0uE',
    appId: '1:174158602420:android:5db47aabdfd513a0c5f7e1',
    messagingSenderId: '174158602420',
    projectId: 'biblioteca-s',
    databaseURL: 'https://biblioteca-s-default-rtdb.firebaseio.com',
    storageBucket: 'biblioteca-s.appspot.com',
  );
}