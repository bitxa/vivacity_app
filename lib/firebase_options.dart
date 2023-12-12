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
    apiKey: 'AIzaSyBh-2jiI0871dClA1nSE2r17VSBrl8D6-g',
    appId: '1:111344231913:web:50a5c5b56c3ff0bfb45778',
    messagingSenderId: '111344231913',
    projectId: 'vivaapp-162b6',
    authDomain: 'vivaapp-162b6.firebaseapp.com',
    storageBucket: 'vivaapp-162b6.appspot.com',
    measurementId: 'G-KB53XEZVH1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA-WaPDZnCqJ3r9cp2VED6iBlaXh_1cHMU',
    appId: '1:111344231913:android:0bd57531af769505b45778',
    messagingSenderId: '111344231913',
    projectId: 'vivaapp-162b6',
    storageBucket: 'vivaapp-162b6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBI_fIy_w1qog9GEEspTB5iZX_5nepdSfo',
    appId: '1:111344231913:ios:2840b14534f250acb45778',
    messagingSenderId: '111344231913',
    projectId: 'vivaapp-162b6',
    storageBucket: 'vivaapp-162b6.appspot.com',
    iosClientId: '111344231913-mk7utj4tqgfv3sphqb7vu042774i48ge.apps.googleusercontent.com',
    iosBundleId: 'com.example.vivacityApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBI_fIy_w1qog9GEEspTB5iZX_5nepdSfo',
    appId: '1:111344231913:ios:893de0365e5e51ebb45778',
    messagingSenderId: '111344231913',
    projectId: 'vivaapp-162b6',
    storageBucket: 'vivaapp-162b6.appspot.com',
    iosClientId: '111344231913-plcc08ul1c2jt9ri4smlskbgsval6bve.apps.googleusercontent.com',
    iosBundleId: 'com.example.vivacityApp.RunnerTests',
  );
}