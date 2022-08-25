import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_it/get_it.dart';

import '../../stores/location_store.dart';
import 'widgets/city_picker.dart';
import 'widgets/search_field.dart';

class LocationScreen extends StatelessWidget {
  LocationScreen({Key? key}) : super(key: key);

  final LocationStore controller = GetIt.I.get<LocationStore>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: CupertinoColors.black,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: CupertinoColors.black,
        ),
        body: Observer(
          builder: (_) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget> [
                const Text(
                  'Selecione sua Localização',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
                SizedBox(
                  width: size.width * 0.8,
                  child: CupertinoButton(
                    color: Colors.purple,
                    borderRadius: const BorderRadius.all(Radius.circular(24)), 
                    onPressed: () {
                      _showBottonSheet(context, size);
                    },
                    child: Text(controller.uf == null ? 'Selecionar Estado' : controller.uf!.name)
                  ),
                ),
                SearchField(),
                Observer(
                  builder: (_) {
                    if (controller.loading) {
                      return const Center(
                        child: SpinKitFadingCube(
                          color: Colors.white,
                          size: 60,
                        ),
                      );
                    }
            
                    if (controller.cityFiltered.isEmpty) {
                      return Center(
                        child: Text(
                          controller.uf == null 
                          ? 'Selecione um estado.'
                          : 'Nenhuma cidade encontrada.',
                          style: Theme.of(context).textTheme.headline5,
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
            
                    return CityPicker();
                  },
                ),
                SizedBox(
                  width: size.width * 0.8,
                  child: CupertinoButton(
                    color: Colors.purple,
                    borderRadius: const BorderRadius.all(Radius.circular(24)), 
                    onPressed: controller.city != null 
                      ? () {
                        controller.addUserLocationToList();
                        controller.saveUserLocations();
                        Navigator.of(context).pop();
                      } 
                      : null,
                    child: const Text('CONFIRMAR')
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Future<void> _showBottonSheet(BuildContext context, Size size) async {
    showModalBottomSheet(
      isDismissible: false,
      elevation: 0,
      backgroundColor: CupertinoColors.systemGrey,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24)
      ),
      builder: (_) {
        return SizedBox(
          height: size.height * 0.3,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
              controller.getCityList(controller.uf!);
            },
            child: CupertinoPicker.builder(
              childCount: controller.ufList.length,
              itemExtent: size.width * 0.2,
              squeeze: 1,
              magnification: 1.5,
              diameterRatio: 1.8,
              useMagnifier: true, 
              onSelectedItemChanged: (int index) {
                controller.setUf(controller.ufList[index]);
              },
              itemBuilder: (context, index) {
                return Center(
                  child: Text(
                    controller.ufList[index].name,
                    style: const TextStyle(
                      color: Colors.white
                    ),
                  ),
                );
              }
            ),
          ),
        );
      }
    );
  }
}