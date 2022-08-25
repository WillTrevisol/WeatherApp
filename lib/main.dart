import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'screens/home/home_screen.dart';
import 'stores/connectivity_store.dart';
import 'stores/location_store.dart';
import 'stores/weather_store.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _registerInstances();
  runApp(const WeatherApp());
}

void _registerInstances() {
  GetIt.I.registerSingleton(ConnectivityStore());
  GetIt.I.registerSingleton(LocationStore());
  GetIt.I.registerSingleton(WeatherStore());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WeatherApp',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          color: CupertinoColors.black,
          elevation: 0,
        ),
        scaffoldBackgroundColor: CupertinoColors.black,
        primarySwatch: Colors.purple,
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: CupertinoColors.white,
            fontSize: 84,
            fontWeight: FontWeight.w300
          ),
          headline2: TextStyle(

          ),
          headline3: TextStyle(

          ),
          headline4: TextStyle(

          ),
          headline5: TextStyle(
            color: CupertinoColors.white,
            fontWeight: FontWeight.w300,
            fontSize: 28,
          ),
          headline6: TextStyle(
            color: CupertinoColors.white,
            fontWeight: FontWeight.w400,
            fontSize: 22,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
