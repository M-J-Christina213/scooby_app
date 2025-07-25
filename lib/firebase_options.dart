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
    apiKey: 'AIzaSyCotlOsxGwN09tOeVW36w962IaxgqHfRJ8',
    appId: '1:526895335996:web:d43ce2da65fb07892dd139',
    messagingSenderId: '526895335996',
    projectId: 'scooby-app-102a4',
    authDomain: 'scooby-app-102a4.firebaseapp.com',
    storageBucket: 'scooby-app-102a4.firebasestorage.app',
    measurementId: 'G-TS88RCWSC6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDJ_RXvp1vpg-yVHLNNlV2vKQlpctl0pAY',
    appId: '1:526895335996:android:3ce94c3845b072cb2dd139',
    messagingSenderId: '526895335996',
    projectId: 'scooby-app-102a4',
    storageBucket: 'scooby-app-102a4.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC2p_LcfjpGW7vt3FiXm3EdVw0YIJIoGh8',
    appId: '1:526895335996:ios:aaacebe27640abeb2dd139',
    messagingSenderId: '526895335996',
    projectId: 'scooby-app-102a4',
    storageBucket: 'scooby-app-102a4.firebasestorage.app',
    iosClientId: '526895335996-c5ci42fuvg463q1qrtualnh0sca2kds3.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplicationScooby',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC2p_LcfjpGW7vt3FiXm3EdVw0YIJIoGh8',
    appId: '1:526895335996:ios:aaacebe27640abeb2dd139',
    messagingSenderId: '526895335996',
    projectId: 'scooby-app-102a4',
    storageBucket: 'scooby-app-102a4.firebasestorage.app',
    iosClientId: '526895335996-c5ci42fuvg463q1qrtualnh0sca2kds3.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplicationScooby',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCotlOsxGwN09tOeVW36w962IaxgqHfRJ8',
    appId: '1:526895335996:web:8a76a39a791934632dd139',
    messagingSenderId: '526895335996',
    projectId: 'scooby-app-102a4',
    authDomain: 'scooby-app-102a4.firebaseapp.com',
    storageBucket: 'scooby-app-102a4.firebasestorage.app',
    measurementId: 'G-ME8THP25HM',
  );
}
