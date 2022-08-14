class Weather {
  
  int temperature;
  String date;
  String time;
  String conditionCode;
  String description;
  String currently;
  String city;
  String cityName;
  int humidity;
  String windSpeedy;
  String sunrise;
  String sunset;
  String conditionSlug;

  Weather({
    required this.temperature,
    required this.date,
    required this.time,
    required this.conditionCode,
    required this.description,
    required this.currently,
    required this.city,
    required this.cityName,
    required this.humidity,
    required this.windSpeedy,
    required this.sunrise,
    required this.sunset,
    required this.conditionSlug
  });

  factory Weather.fromJson(Map<String, dynamic> data) => Weather(
    temperature: data['temp'], 
    date: data['date'], 
    time: data['time'], 
    conditionCode: data['condition_code'], 
    description: data['description'],
    currently: data['currently'],
    city: data['city'],
    cityName: data['city_name'], 
    humidity: data['humidity'], 
    windSpeedy: data['wind_speedy'], 
    sunrise: data['sunrise'],
    sunset: data['sunset'], 
    conditionSlug: data['condition_slug'],
  );

  @override
  String toString() {
    return '''
    Temprature: $temperature,
    Date: $date,
    Time: $time,
    ConditionCode: $conditionCode,
    Description: $description,
    Currently: $currently,
    City: $city,
    CityName: $cityName,
    Humidity: $humidity,
    WindSpeedy: $windSpeedy,
    Sunrise: $sunrise,
    Sunset: $sunset,
    ConditionSlug: $conditionSlug
    ''';
  }

}