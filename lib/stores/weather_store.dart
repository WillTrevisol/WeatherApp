import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../entities/city.dart';
import '../entities/uf.dart';
import '../entities/weather.dart';
import '../repositories/weather_repository.dart';
import 'location_store.dart';
part 'weather_store.g.dart';

// ignore: library_private_types_in_public_api
class WeatherStore = _WeatherStoreBase with _$WeatherStore;

abstract class _WeatherStoreBase with Store {
  
  final LocationStore locationController = GetIt.I.get<LocationStore>();

  _WeatherStoreBase() {
    when(
      (_) => locationController.position != null, 
      () {
        getWeatherByGps(locationController.position!);
      }
    );
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
      }
    } catch (e) {
      setError(e);
    } finally {
      setLoading(false);
    }
  }

}