import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mobx/mobx.dart';
part 'connectivity_store.g.dart';

// ignore: library_private_types_in_public_api
class ConnectivityStore = _ConnectivityStoreBase with _$ConnectivityStore;

abstract class _ConnectivityStoreBase with Store {

  _ConnectivityStoreBase() {
    _setupChecker();
  }

  void _setupChecker() {
    final InternetConnectionChecker check = InternetConnectionChecker.createInstance(
      checkInterval: const Duration(seconds: 3),
      checkTimeout: const Duration(seconds: 3)
    );

    check.onStatusChange.listen(
      (event) {
        setConnected(event == InternetConnectionStatus.connected);
    });
  }

  @observable
  bool connected = false;

  @action
  void setConnected(bool value) => connected = value;
  
}