import 'package:flutter/material.dart';
import 'package:ready_to_use_widgets/feature/network_connection/view/network_dependent_widget.dart';

class NetworkDependentWidgetExample extends StatelessWidget {
  const NetworkDependentWidgetExample({Key? key}) : super(key: key);
  final String title = 'Network Dependent Wiwget';
  final String internetConnected = 'Network Connected';
  final String internetDisconnected = 'Network Disconnected';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: NetworkDependentWidget(
          child: Text(
              internetConnected), // Internet bağlantısı olup olmasına göre gösterilen widget.
          // The widget will be visible upon network connection
          showAlert:
              true, //Internet bağlantısı olmadığında snackbar gösterimine olanak sağlar.
          // Show snackbar according to disconnection
          internetFailMessage: internetDisconnected,
        ),
      ),
    );
  }
}
