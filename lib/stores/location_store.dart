import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../entities/city.dart';
import '../entities/uf.dart';
import '../entities/user_location.dart';
import '../repositories/ibge_repostory.dart';
import 'connectivity_store.dart';

part 'location_store.g.dart';

enum LocationStatus { init, failed, done }
const userLocationKey = 'userLocationsKey';

// ignore: library_private_types_in_public_api
class LocationStore = _LocationStoreBase with _$LocationStore;

abstract class _LocationStoreBase with Store {

  final ConnectivityStore connectivity = GetIt.I.get<ConnectivityStore>();
  late SharedPreferences? sharedPreferences;

  _LocationStoreBase() {
    _getLocation();
    getUfList();
    SharedPreferences.getInstance().then((value) => sharedPreferences = value);
    getUserLocations();
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

  @observable
  ObservableList<UF> ufList = ObservableList<UF>();

  @action
  Future<void> getUfList() async {
    setLoading(true);
    setError(null);
    try {
      final ufResponse = await IbgeRepository().getUFList();

      if (ufResponse != null) {
        ufList.addAll(ufResponse);
      }
    } catch (e) {
      setError(e);
    }
    setLoading(false);
  }

  @observable
  ObservableList<City> cityList = ObservableList<City>();

  @action
  Future<void> getCityList(UF uf) async {
    setLoading(true);
    setError(null);
    cityList.clear();

    try {
      final response = await IbgeRepository().getCityList(uf);

      if (response != null) {
        cityList.addAll(response);
      }
    } catch (e) {
      setError(e);
    }
    setLoading(false);
  }

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  @observable
  dynamic error;

  @action
  void setError(dynamic value) => error = value;

  @observable
  String filter = '';

  @action
  void setFilter(String value) => filter = value;

  @computed
  List<City> get cityFiltered {
    if (filter.isEmpty) {
      return cityList;
    }
    return cityList.where((uf) => uf.name.toLowerCase().contains(filter.toLowerCase())).toList();
  }

  @observable
  UF? uf;

  @action
  void setUf(UF value) => uf = value;

  @observable
  City? city;

  @action
  void setCity(City value) => city = value;

  @observable
  ObservableList<UserLocation> userLocations = ObservableList<UserLocation>();

  @action
  void addUserLocationToList() {
    userLocations.add(
      UserLocation(uf: uf!, city: city!)
    );
  }

  @action
  void removeUserLocationFromList(UserLocation userLocation) {
    userLocations.remove(userLocation);
    saveUserLocations();
  }

  @action
  Future<void> getUserLocations() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final List jsonDecoded = jsonDecode(sharedPreferences!.getString(userLocationKey) ?? '[]');
    userLocations.addAll(jsonDecoded.map((e) => UserLocation.fromJson(e)).toList());
  }

  Future<void> saveUserLocations() async {
    final userLocationJson = jsonEncode(userLocations);
    sharedPreferences?.setString(userLocationKey, userLocationJson);
  }
}