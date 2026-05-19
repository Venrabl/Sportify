import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  static Future<bool> isOnline() async {
    final conn = await Connectivity().checkConnectivity();
    return conn != ConnectivityResult.none;
  }
}
