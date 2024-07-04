import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkConnectivity extends StatefulWidget {
  @override
  _NetworkConnectivityState createState() => _NetworkConnectivityState();
}

class _NetworkConnectivityState extends State<NetworkConnectivity> {
  late Connectivity _connectivity;
  late Stream<ConnectivityResult> _connectivityStream;

  @override
  void initState() {
    super.initState();
    _connectivity = Connectivity();
    _connectivityStream = _connectivity.onConnectivityChanged;
    _connectivityStream.listen(_updateConnectionStatus);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    String message;
    switch (result) {
      case ConnectivityResult.wifi:
        message = "Connected to WiFi";
        break;
      case ConnectivityResult.mobile:
        message = "Connected to Mobile Network";
        break;
      case ConnectivityResult.none:
        message = "No Internet Connection";
        break;
      default:
        message = "Unknown Connection Status";
        break;
    }
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
