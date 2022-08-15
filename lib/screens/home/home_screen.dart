import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_it/get_it.dart';

import '../../stores/weather_store.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final WeatherStore controller = GetIt.I.get<WeatherStore>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/So Hot.png')),
          ),
          child: Observer(
            builder: (_) {
              if (controller.loading || controller.weather == null) {
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


              return Stack(
                alignment: Alignment.center,
                children: <Widget> [
                  Positioned(
                    top: 50,
                    right: 10,
                    left: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget> [
                        IconButton(
                          icon: const Icon(
                            Icons.settings,
                            color: Colors.white,
                          ), 
                          onPressed: () {},
                        ),
                        Text(
                          controller.weather!.city,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ), 
                          onPressed: () {},
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
            },
          ),
        ),
      ),
    );
  }
}
