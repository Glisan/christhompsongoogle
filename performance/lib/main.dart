import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ChangeNotifierProvider(
    create: (context) => ApplicationState(),
    builder: (context, child) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Firebase Performance Monitoring'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Consumer<ApplicationState>(
          builder: (context, appState, _) => Column(
            children: <Widget>[
              const Image(
                  image:
                      AssetImage('assets/perfmon_horizonal_lockup_light.png')),
              const Text('We are using Performance monitoring to monitor a '
                  'function that gets a random string.'),
              ElevatedButton(
                onPressed: () => {appState.updateRandomString()},
                child: const Text('Get Random String'),
              ),
              Text(appState.randomString),
            ],
          ),
        ),
      ),
    );
  }
}

class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }

  String _randomString = '';
  String get randomString => _randomString;

  Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await FirebasePerformance.instance.setPerformanceCollectionEnabled(true);
  }

  void updateRandomString() {
    var trace = FirebasePerformance.instance.newTrace('updateRandomString');
    trace.start();
    var buffer = StringBuffer();
    const options = 'abcdfghijklmnopqrstuvwxyz0123456789';
    var random = Random();
    var randomSize = random.nextInt(100) + 1;
    for (var i = 0; i < randomSize; i++) {
      var nextNum = random.nextInt(options.length);
      buffer.write(options[nextNum]);
    }
    _randomString = buffer.toString();
    notifyListeners();
    trace.stop();
  }
}