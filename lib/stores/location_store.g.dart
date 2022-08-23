// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LocationStore on _LocationStoreBase, Store {
  Computed<List<UF>>? _$ufFilteredComputed;

  @override
  List<UF> get ufFiltered =>
      (_$ufFilteredComputed ??= Computed<List<UF>>(() => super.ufFiltered,
              name: '_LocationStoreBase.ufFiltered'))
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

  late final _$getUfListAsyncAction =
      AsyncAction('_LocationStoreBase.getUfList', context: context);

  @override
  Future<void> getUfList() {
    return _$getUfListAsyncAction.run(() => super.getUfList());
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
  String toString() {
    return '''
locationStatus: ${locationStatus},
position: ${position},
ufList: ${ufList},
loading: ${loading},
error: ${error},
filter: ${filter},
ufFiltered: ${ufFiltered}
    ''';
  }
}
