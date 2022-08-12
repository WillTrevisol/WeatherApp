// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connectivity_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConnectivityStore on _ConnectivityStoreBase, Store {
  late final _$connectedAtom =
      Atom(name: '_ConnectivityStoreBase.connected', context: context);

  @override
  bool get connected {
    _$connectedAtom.reportRead();
    return super.connected;
  }

  @override
  set connected(bool value) {
    _$connectedAtom.reportWrite(value, super.connected, () {
      super.connected = value;
    });
  }

  late final _$_ConnectivityStoreBaseActionController =
      ActionController(name: '_ConnectivityStoreBase', context: context);

  @override
  void setConnected(bool value) {
    final _$actionInfo = _$_ConnectivityStoreBaseActionController.startAction(
        name: '_ConnectivityStoreBase.setConnected');
    try {
      return super.setConnected(value);
    } finally {
      _$_ConnectivityStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
connected: ${connected}
    ''';
  }
}
