// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LocationStore on _LocationStoreBase, Store {
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
  String toString() {
    return '''
locationStatus: ${locationStatus},
position: ${position}
    ''';
  }
}
