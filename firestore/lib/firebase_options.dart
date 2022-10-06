// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAfj_GOB5yKD6lPaVS9hSskKITPuquzpZQ',
    appId: '1:993083111617:web:380d3567efd5f99a67bc40',
    messagingSenderId: '993083111617',
    projectId: 'friendlyeats-flutter-68d79',
    authDomain: 'friendlyeats-flutter-68d79.firebaseapp.com',
    storageBucket: 'friendlyeats-flutter-68d79.appspot.com',
    measurementId: 'G-FSYS2SH1N4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAiC9yhzOEeMcP6dIuKEZCfOdknTzNtYGM',
    appId: '1:993083111617:android:a1aded9943e3dd0367bc40',
    messagingSenderId: '993083111617',
    projectId: 'friendlyeats-flutter-68d79',
    storageBucket: 'friendlyeats-flutter-68d79.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCv_n3A1NBMCZCE3ic60VQKLal61QZ0_jo',
    appId: '1:993083111617:ios:5e141d4618cfea7367bc40',
    messagingSenderId: '993083111617',
    projectId: 'friendlyeats-flutter-68d79',
    storageBucket: 'friendlyeats-flutter-68d79.appspot.com',
    iosClientId: '993083111617-a9q0thbihk8tl0487gfem1hm1ahaieab.apps.googleusercontent.com',
    iosBundleId: 'friendlyeats.example.app',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCv_n3A1NBMCZCE3ic60VQKLal61QZ0_jo',
    appId: '1:993083111617:ios:1b694b280561da1567bc40',
    messagingSenderId: '993083111617',
    projectId: 'friendlyeats-flutter-68d79',
    storageBucket: 'friendlyeats-flutter-68d79.appspot.com',
    iosClientId: '993083111617-lh0dmnumalopnegi244kmfm2o0brl7dg.apps.googleusercontent.com',
    iosBundleId: 'friendlyears.example.app',
  );
}