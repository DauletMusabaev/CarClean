import 'package:car_clean/constant/constant.dart';
import 'package:car_clean/pages/screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          return MaterialApp(
            title: 'Car Clean',
            theme: ThemeData(
              primarySwatch: Colors.red,
              primaryColor: primaryColor,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              fontFamily: 'Montserrat',
            ),
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        });
  }
}
