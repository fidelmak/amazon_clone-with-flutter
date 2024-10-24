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
    apiKey: 'AIzaSyAGHYFMWb2pPaXH1HLk9XFKnHHXxzDW47M',
    appId: '1:692149349595:web:a74f2fdb6384cce56330fe',
    messagingSenderId: '692149349595',
    projectId: 'cityblog-431f5',
    authDomain: 'cityblog-431f5.firebaseapp.com',
    databaseURL: 'https://cityblog-431f5-default-rtdb.firebaseio.com',
    storageBucket: 'cityblog-431f5.appspot.com',
    measurementId: 'G-EWQZKHF5FH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA0uUVPhwmEx4F3gRRDUrgqF5JwXPxEvjI',
    appId: '1:692149349595:android:2de6d27366222de96330fe',
    messagingSenderId: '692149349595',
    projectId: 'cityblog-431f5',
    databaseURL: 'https://cityblog-431f5-default-rtdb.firebaseio.com',
    storageBucket: 'cityblog-431f5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBDBp_iTXuKQl9r7ppqc7nN1UCVHfZBRkk',
    appId: '1:692149349595:ios:ecd13fb7112045ab6330fe',
    messagingSenderId: '692149349595',
    projectId: 'cityblog-431f5',
    databaseURL: 'https://cityblog-431f5-default-rtdb.firebaseio.com',
    storageBucket: 'cityblog-431f5.appspot.com',
    iosBundleId: 'com.example.amazonClone',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBDBp_iTXuKQl9r7ppqc7nN1UCVHfZBRkk',
    appId: '1:692149349595:ios:ecd13fb7112045ab6330fe',
    messagingSenderId: '692149349595',
    projectId: 'cityblog-431f5',
    databaseURL: 'https://cityblog-431f5-default-rtdb.firebaseio.com',
    storageBucket: 'cityblog-431f5.appspot.com',
    iosBundleId: 'com.example.amazonClone',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBDjUpFEkqKnAQAUXp-nuPddaoVzu6SwdI',
    appId: '1:692149349595:web:92bd762fe301aed46330fe',
    messagingSenderId: '692149349595',
    projectId: 'cityblog-431f5',
    authDomain: 'cityblog-431f5.firebaseapp.com',
    databaseURL: 'https://cityblog-431f5-default-rtdb.firebaseio.com',
    storageBucket: 'cityblog-431f5.appspot.com',
    measurementId: 'G-6CP1C45LYR',
  );
}
