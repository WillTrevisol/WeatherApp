import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import 'connectivity_store.dart';

part 'location_store.g.dart';

enum LocationStatus { init, failed, done }

// ignore: library_private_types_in_public_api
class LocationStore = _LocationStoreBase with _$LocationStore;

abstract class _LocationStoreBase with Store {

  final ConnectivityStore connectivity = GetIt.I.get<ConnectivityStore>();

  _LocationStoreBase() {
    _getLocation();
  }

  @observable
  LocationStatus locationStatus = LocationStatus.init;

  @action
  void setLocatioStatus(LocationStatus value) => locationStatus = value;

  @observable
  Position? position;

  @action
  void setPosition(Position value) => position = value;

  Future<void> _getLocation() async {
    Geolocator.checkPermission().then(
      (value) async {
        await Geolocator.requestPermission();

        if (value == LocationPermission.whileInUse || value == LocationPermission.always) {
          setLocatioStatus(LocationStatus.init);

          Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high
          );

          setPosition(position);

          setLocatioStatus(LocationStatus.done);
        }
      }
    );
  }
}