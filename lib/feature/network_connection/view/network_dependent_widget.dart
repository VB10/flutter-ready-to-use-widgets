import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ready_to_use_widgets/feature/network_connection/cubit/network_cubit.dart';

class NetworkDependentWidget extends StatelessWidget {
  const NetworkDependentWidget(
      {Key? key,
      required this.child,
      this.showAlert = false,
      this.internetFailMessage = 'Internet Disconnected'})
      : super(key: key);
  final bool showAlert;
  final Widget
      child; // Internet bağlantısı olduğunda gösterilmesi istenen widget. Örneğin refresh işlemi yapan bir ikon
  //Widget will be shown when network connected
  final String
      internetFailMessage; // Internet bağlantısı koptuğunda gösterilen ikaz. Easy localization ile kullanılabilir. Boş gönderilir ise default 'Internet Disconected' ikazı çıkar
  @override // Network fail message
  Widget build(BuildContext context) {
    return BlocConsumer<NetworkCubit, NetworkState>(
      listener: (context, state) {
        if (state is NetworkDisconnected && showAlert) {
          showDisconnected(context);
        }
      },
      builder: (context, state) {
        if (state is NetworkConnected) {
          return child; //Eğer internet bağlantısı var ise kendisine gönderilen widgetı gösterir.
          //If network connection available shows child widget
        } else if (state is NetworkLoading) {
          return const Center(
            child: CircularProgressIndicator
                .adaptive(), //Eğer internet bağlantısı bekleniyor ise Circular Progress Icon gösterir.
            //If network connection is initial status show Circular Progress Indicator
          );
        } else {
          return const SizedBox
              .shrink(); //Eğer internet bağlantısı yok ise boş sizedbox gösterir.
          // If internet connection is failed show empty box
        }
      },
    );
  }

  void showDisconnected(BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(internetFailMessage)));
  }
}
