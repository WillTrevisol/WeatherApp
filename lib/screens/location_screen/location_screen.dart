import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_it/get_it.dart';

import '../../stores/location_store.dart';

class LocationScreen extends StatelessWidget {
  LocationScreen({Key? key}) : super(key: key);

  final LocationStore controller = GetIt.I.get<LocationStore>();

  final LinearGradient _linearGradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 0.2, 0.8, 1.0],
    colors: [Colors.transparent, Colors.white, Colors.white, Colors.transparent]
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget> [
            const Text(
              'Selecione seu Estado',
              style: TextStyle(
                color: Colors.white
              ),
            ),
            TextField(
              onChanged: controller.setFilter,
            ),
            Observer(
              builder: (_) {
                if (controller.loading || controller.ufList.isEmpty) {
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
          
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: CupertinoPicker.builder(
                    childCount: controller.ufFiltered.length,
                    itemExtent: MediaQuery.of(context).size.width * 0.3,
                    squeeze: 1,
                    magnification: 1.5,
                    diameterRatio: 1.8,
                    useMagnifier: true, 
                    onSelectedItemChanged: (int item) {
                      print(controller.ufFiltered[item].name);
                    }, 
                    itemBuilder: (context, index) {
                      return Center(
                        child: Text(
                          controller.ufFiltered[index].name,
                          style: const TextStyle(
                            color: Colors.white
                          ),
                        ),
                      );
                    }
                  ),
                );
              }
            ),
          ],
        ),
      ),
    );
  }

}