import 'package:vexana/vexana.dart';

class NetworkService {
  late INetworkManager networkManager;
  static NetworkService? _instance;
  static NetworkService get instance {
    if (_instance == null) return _instance = NetworkService._init();
    return _instance!;
  }

  NetworkService._init() {
    final baseOptions = BaseOptions();
    networkManager = NetworkManager(options: baseOptions);
  }
}
