import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'stores/connectivity_store.dart';
import 'stores/location_store.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _registerInstances();
  runApp(const WeatherApp());
}

void _registerInstances() {
  GetIt.I.registerSingleton(ConnectivityStore());
  GetIt.I.registerSingleton(LocationStore());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WeatherApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WeatherApp'),
      ),
      body: Observer(
        builder: (BuildContext context) {
          return Center(child: Text('${GetIt.I.get<ConnectivityStore>().connected}'));
        },
      ),
    );
  }
}
