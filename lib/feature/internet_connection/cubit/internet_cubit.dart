import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final InternetConnectionChecker connectionChecker;
  late StreamSubscription<InternetConnectionStatus>
      connectivityStreamSubscription;

  InternetCubit({required this.connectionChecker}) : super(InternetLoading()) {
    monitorInternetConnection();
  }
  StreamSubscription<InternetConnectionStatus> monitorInternetConnection() {
    return connectivityStreamSubscription =
        connectionChecker.onStatusChange.listen(
      (InternetConnectionStatus status) {
        switch (status) {
          case InternetConnectionStatus.connected:
            emit(InternetConnected());
            break;
          case InternetConnectionStatus.disconnected:
            emit(InternetDisconnected());
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
