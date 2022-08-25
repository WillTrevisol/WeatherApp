// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LocationStore on _LocationStoreBase, Store {
  Computed<List<City>>? _$cityFilteredComputed;

  @override
  List<City> get cityFiltered =>
      (_$cityFilteredComputed ??= Computed<List<City>>(() => super.cityFiltered,
              name: '_LocationStoreBase.cityFiltered'))
          .value;

  late final _$locationStatusAtom =
      Atom(name: '_LocationStoreBase.locationStatus', context: context);

  @override
  LocationStatus get locationStatus {
    _$locationStatusAtom.reportRead();
    return super.locationStatus;
  }

  @override
  set locationStatus(LocationStatus value) {
    _$locationStatusAtom.reportWrite(value, super.locationStatus, () {
      super.locationStatus = value;
    });
  }

  late final _$positionAtom =
      Atom(name: '_LocationStoreBase.position', context: context);

  @override
  Position? get position {
    _$positionAtom.reportRead();
    return super.position;
  }

  @override
  set position(Position? value) {
    _$positionAtom.reportWrite(value, super.position, () {
      super.position = value;
    });
  }

  late final _$ufListAtom =
      Atom(name: '_LocationStoreBase.ufList', context: context);

  @override
  ObservableList<UF> get ufList {
    _$ufListAtom.reportRead();
    return super.ufList;
  }

  @override
  set ufList(ObservableList<UF> value) {
    _$ufListAtom.reportWrite(value, super.ufList, () {
      super.ufList = value;
    });
  }

  late final _$cityListAtom =
      Atom(name: '_LocationStoreBase.cityList', context: context);

  @override
  ObservableList<City> get cityList {
    _$cityListAtom.reportRead();
    return super.cityList;
  }

  @override
  set cityList(ObservableList<City> value) {
    _$cityListAtom.reportWrite(value, super.cityList, () {
      super.cityList = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_LocationStoreBase.loading', context: context);

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
      Atom(name: '_LocationStoreBase.error', context: context);

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

  late final _$filterAtom =
      Atom(name: '_LocationStoreBase.filter', context: context);

  @override
  String get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(String value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  late final _$ufAtom = Atom(name: '_LocationStoreBase.uf', context: context);

  @override
  UF? get uf {
    _$ufAtom.reportRead();
    return super.uf;
  }

  @override
  set uf(UF? value) {
    _$ufAtom.reportWrite(value, super.uf, () {
      super.uf = value;
    });
  }

  late final _$cityAtom =
      Atom(name: '_LocationStoreBase.city', context: context);

  @override
  City? get city {
    _$cityAtom.reportRead();
    return super.city;
  }

  @override
  set city(City? value) {
    _$cityAtom.reportWrite(value, super.city, () {
      super.city = value;
    });
  }

  late final _$getUfListAsyncAction =
      AsyncAction('_LocationStoreBase.getUfList', context: context);

  @override
  Future<void> getUfList() {
    return _$getUfListAsyncAction.run(() => super.getUfList());
  }

  late final _$getCityListAsyncAction =
      AsyncAction('_LocationStoreBase.getCityList', context: context);

  @override
  Future<void> getCityList(UF uf) {
    return _$getCityListAsyncAction.run(() => super.getCityList(uf));
  }

  late final _$_LocationStoreBaseActionController =
      ActionController(name: '_LocationStoreBase', context: context);

  @override
  void setLocatioStatus(LocationStatus value) {
    final _$actionInfo = _$_LocationStoreBaseActionController.startAction(
        name: '_LocationStoreBase.setLocatioStatus');
    try {
      return super.setLocatioStatus(value);
    } finally {
      _$_LocationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPosition(Position value) {
    final _$actionInfo = _$_LocationStoreBaseActionController.startAction(
        name: '_LocationStoreBase.setPosition');
    try {
      return super.setPosition(value);
    } finally {
      _$_LocationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_LocationStoreBaseActionController.startAction(
        name: '_LocationStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_LocationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(dynamic value) {
    final _$actionInfo = _$_LocationStoreBaseActionController.startAction(
        name: '_LocationStoreBase.setError');
    try {
      return super.setError(value);
    } finally {
      _$_LocationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFilter(String value) {
    final _$actionInfo = _$_LocationStoreBaseActionController.startAction(
        name: '_LocationStoreBase.setFilter');
    try {
      return super.setFilter(value);
    } finally {
      _$_LocationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUf(UF value) {
    final _$actionInfo = _$_LocationStoreBaseActionController.startAction(
        name: '_LocationStoreBase.setUf');
    try {
      return super.setUf(value);
    } finally {
      _$_LocationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCity(City value) {
    final _$actionInfo = _$_LocationStoreBaseActionController.startAction(
        name: '_LocationStoreBase.setCity');
    try {
      return super.setCity(value);
    } finally {
      _$_LocationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
locationStatus: ${locationStatus},
position: ${position},
ufList: ${ufList},
cityList: ${cityList},
loading: ${loading},
error: ${error},
filter: ${filter},
uf: ${uf},
city: ${city},
cityFiltered: ${cityFiltered}
    ''';
  }
}
