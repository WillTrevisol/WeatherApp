import '../entities/weather.dart';

class WeatherRepository {

  Future<Weather> getWeather() async {
    return Weather();
  }

}