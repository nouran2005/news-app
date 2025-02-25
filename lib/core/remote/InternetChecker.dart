import 'package:connectivity_plus/connectivity_plus.dart';

class InternetChecker {
  static Future<bool> CheckNetwork() async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.wifi) || connectivityResult.contains(ConnectivityResult.mobile)) {
      return true;
    } 
      return false;
    
  }
}