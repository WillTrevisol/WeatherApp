import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../stores/location_store.dart';
import '../location_screen/location_screen.dart';

class MyLocationsScreen extends StatelessWidget {
  MyLocationsScreen({Key? key}) : super(key: key);

  final controller = GetIt.I.get<LocationStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Localizações'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            CupertinoPageRoute(builder: (_) => LocationScreen())
          );
        } ,
        child: const Icon(CupertinoIcons.add_circled),
      ),
      body: Observer(
        builder: (_) {
          
          if (controller.userLocations.isEmpty) {
            return Center(
              child: Text(
                'Nenhuma localização encontrada.',
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.center,
              ),
            );
          }

          return ListView.builder(
            itemCount: controller.userLocations.length,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: ListTile(
                  title: Text(
                    controller.userLocations[index].city.name,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  trailing: const Icon(
                    CupertinoIcons.location_solid,
                    color: CupertinoColors.white,
                  ),
                  onLongPress: () {
                    showCupertinoModalPopup(
                      context: context, 
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: const Text('Atenção'),
                          content: Text(
                            'Deseja excluir a localização ${controller.userLocations[index].city.name}?'
                          ),
                          actions: <Widget> [
                            CupertinoActionSheetAction(
                              isDestructiveAction: true,
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Cancelar'),
                            ),
                            CupertinoActionSheetAction(
                              onPressed: () {
                                controller.removeUserLocationFromList(
                                  controller.userLocations[index],
                                );
                                controller.saveUserLocations();
                                Navigator.of(context).pop();
                              },
                              child: const Text('Confirmar'),
                            ),
                          ],
                        );
                      }
                    );
                  },
                ),
              );
            }
          );

        }
      ),
    );
  }
}