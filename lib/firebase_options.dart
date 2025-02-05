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
    apiKey: 'AIzaSyBV1UYZsEemA5IPRzMluGRxIw8TBP6Req0',
    appId: '1:503461756807:web:aaf977a5dee75678649d22',
    messagingSenderId: '503461756807',
    projectId: 'baristapros',
    authDomain: 'baristapros.firebaseapp.com',
    storageBucket: 'baristapros.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCTz-IEMy5qJWC-KWtU3mDVMR0LIX1LPn4',
    appId: '1:503461756807:android:da68fc548e181a58649d22',
    messagingSenderId: '503461756807',
    projectId: 'baristapros',
    storageBucket: 'baristapros.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyClX865iKk4u4f-l_-NehmCS6en8DRlNto',
    appId: '1:503461756807:ios:1750627897135da6649d22',
    messagingSenderId: '503461756807',
    projectId: 'baristapros',
    storageBucket: 'baristapros.firebasestorage.app',
    iosBundleId: 'com.example.trytest',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyClX865iKk4u4f-l_-NehmCS6en8DRlNto',
    appId: '1:503461756807:ios:1750627897135da6649d22',
    messagingSenderId: '503461756807',
    projectId: 'baristapros',
    storageBucket: 'baristapros.firebasestorage.app',
    iosBundleId: 'com.example.trytest',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBV1UYZsEemA5IPRzMluGRxIw8TBP6Req0',
    appId: '1:503461756807:web:193f73297d85c4d2649d22',
    messagingSenderId: '503461756807',
    projectId: 'baristapros',
    authDomain: 'baristapros.firebaseapp.com',
    storageBucket: 'baristapros.firebasestorage.app',
  );
}
