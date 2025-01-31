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
    apiKey: 'AIzaSyDgR5Si_G_dTzoUr_EQcyrjvR94fjMF9wc',
    appId: '1:371504018071:web:9d13a21e2ad3b1bc82efd2',
    messagingSenderId: '371504018071',
    projectId: 'hackaddictproj',
    authDomain: 'hackaddictproj.firebaseapp.com',
    storageBucket: 'hackaddictproj.firebasestorage.app',
    measurementId: 'G-R2MWYZ22BW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD5w9moI6GteZ76RfevMzvw9nDpdQyMxCw',
    appId: '1:371504018071:android:a17f6fbcdfe7cd9e82efd2',
    messagingSenderId: '371504018071',
    projectId: 'hackaddictproj',
    storageBucket: 'hackaddictproj.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAI_RPnIJILe5tVjnbeXsTmtVm9kRnJym8',
    appId: '1:371504018071:ios:6b1a26bc89672fb782efd2',
    messagingSenderId: '371504018071',
    projectId: 'hackaddictproj',
    storageBucket: 'hackaddictproj.firebasestorage.app',
    iosBundleId: 'com.example.hackAAddict',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAI_RPnIJILe5tVjnbeXsTmtVm9kRnJym8',
    appId: '1:371504018071:ios:6b1a26bc89672fb782efd2',
    messagingSenderId: '371504018071',
    projectId: 'hackaddictproj',
    storageBucket: 'hackaddictproj.firebasestorage.app',
    iosBundleId: 'com.example.hackAAddict',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDgR5Si_G_dTzoUr_EQcyrjvR94fjMF9wc',
    appId: '1:371504018071:web:2915529b61cef9b182efd2',
    messagingSenderId: '371504018071',
    projectId: 'hackaddictproj',
    authDomain: 'hackaddictproj.firebaseapp.com',
    storageBucket: 'hackaddictproj.firebasestorage.app',
    measurementId: 'G-3ECSLRLQ5E',
  );
}
