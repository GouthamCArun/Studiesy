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
    apiKey: 'AIzaSyAvXSSHSTbm7vXR_0mySUwOPJWlvZ1E480',
    appId: '1:1070198266308:web:ee0546f9c31da90d256c91',
    messagingSenderId: '1070198266308',
    projectId: 'studiesy',
    authDomain: 'studiesy.firebaseapp.com',
    storageBucket: 'studiesy.appspot.com',
    measurementId: 'G-SPW2YS1XML',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDnMCjizFK9rzNBwxa8Lrk7SO7g7poopoE',
    appId: '1:1070198266308:android:e4dd4f4a6ed8b33e256c91',
    messagingSenderId: '1070198266308',
    projectId: 'studiesy',
    storageBucket: 'studiesy.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBP6g_t075b2bxP4HYo1CzsU_STZUHdi-U',
    appId: '1:1070198266308:ios:94b1bfc14e18297e256c91',
    messagingSenderId: '1070198266308',
    projectId: 'studiesy',
    storageBucket: 'studiesy.appspot.com',
    iosBundleId: 'com.example.studiesy',
  );
}
