// import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:model_application/view.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseCrashlytics.instance.enableInDevMode = true;
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random info',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Crash Button Example'),
        ),
        body: Center(
          child: MaterialButton(
            onPressed: () {
              // To simulate a crash
              throw Exception('Test Crash');
            },
            child: Text('Test Crash'),
          ),
        ),
      ),
    );
  }
}

