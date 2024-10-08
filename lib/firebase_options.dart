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
    apiKey: 'AIzaSyCD5uUSjnfQuERx_9tMtxbp1iO32O1iw7E',
    appId: '1:674765051156:web:6cb8544e09017f139e1e01',
    messagingSenderId: '674765051156',
    projectId: 'koszernapolskaapp',
    authDomain: 'koszernapolskaapp.firebaseapp.com',
    storageBucket: 'koszernapolskaapp.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyALRyaDSl8_PYlBG3Uz87CThFv4AOf7jDs',
    appId: '1:674765051156:android:9f6315144e3066fc9e1e01',
    messagingSenderId: '674765051156',
    projectId: 'koszernapolskaapp',
    storageBucket: 'koszernapolskaapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBHgUbQjyMZhGJ5eDYYlrBVENb8BRNvx58',
    appId: '1:674765051156:ios:d12f6b6d33a363939e1e01',
    messagingSenderId: '674765051156',
    projectId: 'koszernapolskaapp',
    storageBucket: 'koszernapolskaapp.appspot.com',
    iosBundleId: 'com.example.koszernapolska',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBHgUbQjyMZhGJ5eDYYlrBVENb8BRNvx58',
    appId: '1:674765051156:ios:d12f6b6d33a363939e1e01',
    messagingSenderId: '674765051156',
    projectId: 'koszernapolskaapp',
    storageBucket: 'koszernapolskaapp.appspot.com',
    iosBundleId: 'com.example.koszernapolska',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCD5uUSjnfQuERx_9tMtxbp1iO32O1iw7E',
    appId: '1:674765051156:web:d86df939db3146cb9e1e01',
    messagingSenderId: '674765051156',
    projectId: 'koszernapolskaapp',
    authDomain: 'koszernapolskaapp.firebaseapp.com',
    storageBucket: 'koszernapolskaapp.appspot.com',
  );
}
