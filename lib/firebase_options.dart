// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members, no_default_cases
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
    apiKey: 'AIzaSyAfeowYnJikzvduuzjRwVE4wM8P28zN3YI',
    appId: '1:805516312755:web:cbcada596d6bced24ab0c6',
    messagingSenderId: '805516312755',
    projectId: 'dicoding-chatting-86a6d',
    authDomain: 'dicoding-chatting-86a6d.firebaseapp.com',
    storageBucket: 'dicoding-chatting-86a6d.appspot.com',
    measurementId: 'G-RSHVCZXC2E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBs12TjRkcJfMHxoXV3gzq_BmHfTgErfYA',
    appId: '1:805516312755:android:19a970509ecec6194ab0c6',
    messagingSenderId: '805516312755',
    projectId: 'dicoding-chatting-86a6d',
    storageBucket: 'dicoding-chatting-86a6d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDC9mEqo0kDSfvoscU50ouUUl8zl0u5DMY',
    appId: '1:805516312755:ios:5440f0eba0ec38124ab0c6',
    messagingSenderId: '805516312755',
    projectId: 'dicoding-chatting-86a6d',
    storageBucket: 'dicoding-chatting-86a6d.appspot.com',
    iosClientId:
        '805516312755-aba6shvpe5n4md7ulprte7gf1928bip9.apps.googleusercontent.com',
    iosBundleId: 'com.example.dicodingChattingFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDC9mEqo0kDSfvoscU50ouUUl8zl0u5DMY',
    appId: '1:805516312755:ios:5440f0eba0ec38124ab0c6',
    messagingSenderId: '805516312755',
    projectId: 'dicoding-chatting-86a6d',
    storageBucket: 'dicoding-chatting-86a6d.appspot.com',
    iosClientId:
        '805516312755-aba6shvpe5n4md7ulprte7gf1928bip9.apps.googleusercontent.com',
    iosBundleId: 'com.example.dicodingChattingFirebase',
  );
}
