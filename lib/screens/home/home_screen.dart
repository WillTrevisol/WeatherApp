import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:get_it/get_it.dart';

import '../../stores/weather_store.dart';
import '../my_locations/my_locations.dart';
import 'widgets/background.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final WeatherStore controller = GetIt.I.get<WeatherStore>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Container(
          constraints: const BoxConstraints.expand(),
          color: Colors.black,
          child: Observer(
            builder: (_) {
              if (controller.loading && controller.weather == null) {
                return const Center(
                  child: SpinKitFadingCube(
                    color: Colors.white,
                    size: 60,
                  ),
                );
              }

              if (controller.error != null) {
                return Center(
                  child: Text(
                    controller.error,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                );
              }

              if (controller.weather != null) {
                return Stack(
                  alignment: Alignment.center,
                  children: <Widget> [
                    BackgroundWidget(),
                    Positioned(
                      top: 50,
                      right: 10,
                      left: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget> [
                          IconButton(
                            icon: const Icon(
                              CupertinoIcons.location_solid,
                              color: Colors.white,
                            ), 
                            onPressed: () {
                              Navigator.of(context).push(
                                CupertinoPageRoute(
                                  builder: (_) => MyLocationsScreen(),
                                ),
                              );
                            },
                          ),
                          Text(
                            controller.weather!.city,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          IconButton(
                            icon: const Icon(
                              CupertinoIcons.refresh_bold,
                              color: Colors.white,
                            ), 
                            onPressed: () {
                              controller.getWeatherByGps();
                            },
                          ),
                        ],
                      )
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget> [
                        Text(
                          '${controller.weather!.temperature}º',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        Text(
                          controller.weather!.description,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ],
                    ),
                  ],
                );
              }
              
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
