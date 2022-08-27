import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:get_it/get_it.dart';

import '../../../stores/weather_store.dart';

class BackgroundWidget extends StatelessWidget {
  BackgroundWidget({Key? key}) : super(key: key);

  final WeatherStore controller = GetIt.I.get<WeatherStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return WeatherBg(
          weatherType: controller.weatherType,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        );
      },
    );
  }
}
