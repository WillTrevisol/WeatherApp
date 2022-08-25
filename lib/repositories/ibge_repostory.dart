import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/config.dart';
import '../entities/city.dart';
import '../entities/uf.dart';

class IbgeRepository {

  Future<List<UF>?> getUFList() async {

    final sharedPreferences = await SharedPreferences.getInstance();

    if (sharedPreferences.containsKey('ufList')) {
      final jsonList = jsonDecode(sharedPreferences.getString('ufList')!);

      return jsonList.map<UF>((uf) => UF.fromJson(uf)).toList()
        ..sort(((UF a, UF b) => a.name.toLowerCase().compareTo(b.name.toLowerCase())));
    }

    try {
      
      final response = await Dio().get<List>(Config.igbeAddress);

      sharedPreferences.setString('ufList', jsonEncode(response.data));

      return response.data?.map<UF>((uf) => UF.fromJson(uf)).toList()
        ?..sort(((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase())));

    } on DioError {
      return Future.error('Falha ao obter lista de estados.');
    }

  }

  Future<List<City>?> getCityList(UF uf) async {
    final String endPoint = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados/${uf.id}/municipios';

    try {
      final response = await Dio().get<List>(endPoint);
      final cityList = response.data?.map<City>((city) => City.fromJson(city)).toList()
        ?..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));

      return cityList;
    } catch(e) {
      return Future.error('Falha ao obter lista de cidades.');
    }
  }

}