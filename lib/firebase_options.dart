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
    apiKey: 'AIzaSyAUhG5s2ZkalsZvxEaLGUy6QSYkMhkyFUM',
    appId: '1:464727409064:web:d66d9af2d486717ab89d9d',
    messagingSenderId: '464727409064',
    projectId: 'module3-2ac69',
    authDomain: 'module3-2ac69.firebaseapp.com',
    storageBucket: 'module3-2ac69.appspot.com',
    measurementId: 'G-FMVH66H0CZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC4DClL-6BKfZr_5cHe5xzzPMr5J-OWJSI',
    appId: '1:464727409064:android:20963dfde28fbd54b89d9d',
    messagingSenderId: '464727409064',
    projectId: 'module3-2ac69',
    storageBucket: 'module3-2ac69.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCBZMExG-fkgQPo1I63jzwD0_Ak5jLujj4',
    appId: '1:464727409064:ios:26ed9072a325fc8db89d9d',
    messagingSenderId: '464727409064',
    projectId: 'module3-2ac69',
    storageBucket: 'module3-2ac69.appspot.com',
    iosBundleId: 'com.sreelakshmi.module3',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCBZMExG-fkgQPo1I63jzwD0_Ak5jLujj4',
    appId: '1:464727409064:ios:26ed9072a325fc8db89d9d',
    messagingSenderId: '464727409064',
    projectId: 'module3-2ac69',
    storageBucket: 'module3-2ac69.appspot.com',
    iosBundleId: 'com.sreelakshmi.module3',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAUhG5s2ZkalsZvxEaLGUy6QSYkMhkyFUM',
    appId: '1:464727409064:web:34a1d2b139c53441b89d9d',
    messagingSenderId: '464727409064',
    projectId: 'module3-2ac69',
    authDomain: 'module3-2ac69.firebaseapp.com',
    storageBucket: 'module3-2ac69.appspot.com',
    measurementId: 'G-H03JFT4GFH',
  );
}
