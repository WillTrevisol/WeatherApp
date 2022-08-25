import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../entities/city.dart';
import '../entities/uf.dart';
import '../entities/weather.dart';
import '../repositories/weather_repository.dart';
import 'location_store.dart';
part 'weather_store.g.dart';

const weatherKey = 'weatherKey';

// ignore: library_private_types_in_public_api
class WeatherStore = _WeatherStoreBase with _$WeatherStore;

abstract class _WeatherStoreBase with Store {
  
  final LocationStore locationController = GetIt.I.get<LocationStore>();
  late SharedPreferences sharedPreferences;

  _WeatherStoreBase() {
    SharedPreferences.getInstance().then((value) {
      sharedPreferences = value;
      if (sharedPreferences.containsKey(weatherKey)) {
        getWeatherFromDevice();
      } else {
        when(
          (_) => locationController.position != null, 
          () {
            getWeatherByGps(locationController.position!);
          }
        );
      }
    });
  }

  @observable
  Weather? weather;

  @action
  void setWeather(Weather value) => weather = value;

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  @observable
  dynamic error;

  @action
  void setError(dynamic value) => error = value;

  Future<void> getWeatherByGps(Position position) async {
    setError(null);
    try {
      setLoading(true);
      final weather = await WeatherRepository().getWeatherbyGps(position);

      if (weather != null) {
        setWeather(weather);
        saveWeatherOnDevice();
      }
    } catch (e) {
      setError(e);
    } finally {
      setLoading(false);
    }
  }

  Future<void> getWeatherByCityUf(UF uf, City city) async {
    setError(null);
    try {
      setLoading(true);
      final weather = await WeatherRepository().getWeatherbyCityUf(uf: uf, city: city);

      if (weather != null) {
        setWeather(weather);
        saveWeatherOnDevice();
      }
    } catch (e) {
      setError(e);
    } finally {
      setLoading(false);
    }
  }

  Future<void> getWeatherFromDevice() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final json = sharedPreferences.getString(weatherKey);
    if (json != null) {
      setWeather(Weather.fromJson(jsonDecode(json)));
    }
  }

  Future<void> saveWeatherOnDevice() async {
    final weatherJson = jsonEncode(weather);
    sharedPreferences.setString(weatherKey, weatherJson);
  }
}