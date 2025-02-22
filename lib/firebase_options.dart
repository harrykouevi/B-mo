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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBzQDWAcKmrRNlSl2k36HSIEGAW5VGu_QI',
    appId: '1:82342958619:android:5d2afd95efb2fab7a08abe',
    messagingSenderId: '82342958619',
    projectId: 'beautysalons-9a815',
    storageBucket: 'beautysalons-9a815.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBctgLpsvapKQ7kcgHS7pK3NjCa7RZiSSo',
    appId: '1:82342958619:ios:0ebf3d9c94aea3f6a08abe',
    messagingSenderId: '82342958619',
    projectId: 'beautysalons-9a815',
    storageBucket: 'beautysalons-9a815.appspot.com',
    androidClientId: '82342958619-0tt7ca2s9hbtcho1kh2bpl0omns9o23t.apps.googleusercontent.com',
    iosClientId: '82342958619-rvlol4agcgbhn006j45tldmmktu3j7be.apps.googleusercontent.com',
    iosBundleId: 'com.smartersvision.beauty-salons',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCUm9vIdf5Z498e6o3Cq9ATOIGqNKfK-Cg',
    appId: '1:82342958619:web:9554f68671134ed1a08abe',
    messagingSenderId: '82342958619',
    projectId: 'beautysalons-9a815',
    authDomain: 'beautysalons-9a815.firebaseapp.com',
    storageBucket: 'beautysalons-9a815.appspot.com',
  );

}