import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';

import '../config/config.dart';
import '../entities/city.dart';
import '../entities/uf.dart';
import '../entities/weather.dart';

class WeatherRepository {

  Future<Weather?> getWeatherbyGps(Position position) async {

    try {
      final response = await Dio().get('${Config.serverAddress}&lat=${position.latitude}&lon=${position.longitude}&array_limit=1');

      return Weather.fromJson(response.data['results']);
    } catch (e) {
      return Future.error('Erro ao obter dados');
    }
  }

  Future<Weather?> getWeatherbyCityUf({required UF uf, required City city}) async {

    try {
      final response = await Dio().get('${Config.serverAddress}&city_name=${city.name},${uf.initials}&array_limit=1');
      
      return Weather.fromJson(response.data['results']);
    } catch (e) {
      return Future.error('Erro ao obter dados');
    }
  }

}