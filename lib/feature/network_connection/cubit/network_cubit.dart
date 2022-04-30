import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'network_state.dart';

class NetworkCubit extends Cubit<NetworkState> {
  final InternetConnectionChecker connectionChecker;
  late StreamSubscription<InternetConnectionStatus>
      connectivityStreamSubscription;

  NetworkCubit({required this.connectionChecker}) : super(NetworkLoading()) {
    monitorInternetConnection();
  }
  StreamSubscription<InternetConnectionStatus> monitorInternetConnection() {
    return connectivityStreamSubscription =
        connectionChecker.onStatusChange.listen(
      (InternetConnectionStatus status) {
        switch (status) {
          case InternetConnectionStatus.connected:
            emit(NetworkConnected());
            break;
          case InternetConnectionStatus.disconnected:
            emit(NetworkDisconnected());
            break;
        }
      },
    );
  }

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }
}
