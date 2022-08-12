import 'package:geocoding/geocoding.dart';
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
    autorun((_) async {
      if (connectivity.connected) {
        getLocation();
      }
    });
  }

  @observable
  LocationStatus locationStatus = LocationStatus.init;

  @action
  void setLocatioStatus(LocationStatus value) => locationStatus = value;

  Future<void> getLocation() async {
    Geolocator.checkPermission().then(
      (value) async {
        await Geolocator.requestPermission();

        if (value == LocationPermission.whileInUse || value == LocationPermission.always) {

          Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high
          );

          final List<Placemark> places = await placemarkFromCoordinates(
            position.latitude,
            position.longitude,
            localeIdentifier: 'pt_BR',
          );

          Placemark placemark = places.first;

          print(placemark.country);
          print(placemark.administrativeArea);
          print(placemark.subAdministrativeArea);
          print(placemark.locality);
        }
      }
    );
  }
}