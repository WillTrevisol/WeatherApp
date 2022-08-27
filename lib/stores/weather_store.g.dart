// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WeatherStore on _WeatherStoreBase, Store {
  Computed<WeatherType>? _$weatherTypeComputed;

  @override
  WeatherType get weatherType =>
      (_$weatherTypeComputed ??= Computed<WeatherType>(() => super.weatherType,
              name: '_WeatherStoreBase.weatherType'))
          .value;

  late final _$weatherAtom =
      Atom(name: '_WeatherStoreBase.weather', context: context);

  @override
  Weather? get weather {
    _$weatherAtom.reportRead();
    return super.weather;
  }

  @override
  set weather(Weather? value) {
    _$weatherAtom.reportWrite(value, super.weather, () {
      super.weather = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_WeatherStoreBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$errorAtom =
      Atom(name: '_WeatherStoreBase.error', context: context);

  @override
  dynamic get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(dynamic value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$_WeatherStoreBaseActionController =
      ActionController(name: '_WeatherStoreBase', context: context);

  @override
  void setWeather(Weather value) {
    final _$actionInfo = _$_WeatherStoreBaseActionController.startAction(
        name: '_WeatherStoreBase.setWeather');
    try {
      return super.setWeather(value);
    } finally {
      _$_WeatherStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_WeatherStoreBaseActionController.startAction(
        name: '_WeatherStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_WeatherStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(dynamic value) {
    final _$actionInfo = _$_WeatherStoreBaseActionController.startAction(
        name: '_WeatherStoreBase.setError');
    try {
      return super.setError(value);
    } finally {
      _$_WeatherStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
weather: ${weather},
loading: ${loading},
error: ${error},
weatherType: ${weatherType}
    ''';
  }
}
