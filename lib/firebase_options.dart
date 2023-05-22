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
    apiKey: 'AIzaSyCB3VnvkqYeSogcgssvVImCpYgrOzP0foI',
    appId: '1:138523150733:web:db28fe579a645c1d5dd5c4',
    messagingSenderId: '138523150733',
    projectId: 'zotfeast',
    authDomain: 'zotfeast.firebaseapp.com',
    storageBucket: 'zotfeast.appspot.com',
    measurementId: 'G-7X0X9SN32D',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAQhqELpFjD56g7E2bmyIEsnm1Li3LAsfE',
    appId: '1:138523150733:android:bfdcde006fa3ec6e5dd5c4',
    messagingSenderId: '138523150733',
    projectId: 'zotfeast',
    storageBucket: 'zotfeast.appspot.com',
  );
}
