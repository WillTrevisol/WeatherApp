import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import '../../../stores/location_store.dart';

class CityPicker extends StatelessWidget {
  CityPicker({Key? key}) : super(key: key);

  final LocationStore controller = GetIt.I.get<LocationStore>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: size.height * 0.3,
      child: CupertinoPicker.builder(
        childCount: controller.cityFiltered.length,
        itemExtent: size.width * 0.2,
        squeeze: 1,
        magnification: 1.5,
        diameterRatio: 1.8,
        useMagnifier: true, 
        onSelectedItemChanged: (int index) {
          controller.setCity(controller.cityFiltered[index]);
        }, 
        itemBuilder: (context, index) {
          return Center(
            child: Text(
              controller.cityFiltered[index].name,
              style: const TextStyle(
                color: CupertinoColors.white
              ),
            ),
          );
        },
      ),
    );
  }
}