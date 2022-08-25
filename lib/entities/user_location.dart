import 'city.dart';
import 'uf.dart';

class UserLocation {

  UF uf;
  City city;

  UserLocation({required this.uf, required this.city});

  factory UserLocation.fromJson(Map<String, dynamic> data) => UserLocation(
    uf: UF.fromJson(data['uf']), 
    city: City.fromJson(data['city']),
  );

  Map<String, dynamic> toJson() => {
    'uf': uf,
    'city': city, 
  };

  @override
  String toString() {
    return 'UF: ${uf.toString()}, City: ${city.toString()}';
  }

}