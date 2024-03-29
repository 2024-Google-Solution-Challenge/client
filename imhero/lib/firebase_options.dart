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
    apiKey: 'AIzaSyDpwdAJZMmvaxD-kyz0jZfVWe3tvU--OqY',
    appId: '1:468540968920:web:eba1f2dc4e22e8febc2cad',
    messagingSenderId: '468540968920',
    projectId: 'i-m-hero-fcc9f',
    authDomain: 'i-m-hero-fcc9f.firebaseapp.com',
    storageBucket: 'i-m-hero-fcc9f.appspot.com',
    measurementId: 'G-2LC1NH8871',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAjyML-rptkXGnLyGVr_BQpOxuVccG0PWY',
    appId: '1:468540968920:android:83e10495490cd015bc2cad',
    messagingSenderId: '468540968920',
    projectId: 'i-m-hero-fcc9f',
    storageBucket: 'i-m-hero-fcc9f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDcy6NbjNRyzz6JyFwZgnk4aI0sfwslc1E',
    appId: '1:468540968920:ios:21480bb71908e556bc2cad',
    messagingSenderId: '468540968920',
    projectId: 'i-m-hero-fcc9f',
    storageBucket: 'i-m-hero-fcc9f.appspot.com',
    iosBundleId: 'com.example.imhero',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDcy6NbjNRyzz6JyFwZgnk4aI0sfwslc1E',
    appId: '1:468540968920:ios:89cd88fa6de326fcbc2cad',
    messagingSenderId: '468540968920',
    projectId: 'i-m-hero-fcc9f',
    storageBucket: 'i-m-hero-fcc9f.appspot.com',
    iosBundleId: 'com.example.imhero.RunnerTests',
  );
}
