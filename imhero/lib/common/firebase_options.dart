// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyAOI8nW71CbORsmnhsAj0PQod6-0HFGrkE',
    appId: '1:498836323416:web:0e8611ecbb5dc4eb191e2d',
    messagingSenderId: '498836323416',
    projectId: 'practice-4196b',
    authDomain: 'practice-4196b.firebaseapp.com',
    storageBucket: 'practice-4196b.appspot.com',
    measurementId: 'G-KJLVD8HNZF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDAiRkfxp0SYbD5hch4DUVT5lwZ-dp3QLg',
    appId: '1:498836323416:android:71f7a90221b7a58d191e2d',
    messagingSenderId: '498836323416',
    projectId: 'practice-4196b',
    storageBucket: 'practice-4196b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD9FIp862Nsw5ql0ely8TJS4fqUbxVD134',
    appId: '1:498836323416:ios:2214748783528c74191e2d',
    messagingSenderId: '498836323416',
    projectId: 'practice-4196b',
    storageBucket: 'practice-4196b.appspot.com',
    iosBundleId: 'com.example.practice',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD9FIp862Nsw5ql0ely8TJS4fqUbxVD134',
    appId: '1:498836323416:ios:5f28842e02c1022f191e2d',
    messagingSenderId: '498836323416',
    projectId: 'practice-4196b',
    storageBucket: 'practice-4196b.appspot.com',
    iosBundleId: 'com.example.practice.RunnerTests',
  );
}
