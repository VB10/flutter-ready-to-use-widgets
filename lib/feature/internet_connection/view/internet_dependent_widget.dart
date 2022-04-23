import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../atomic/sizedBox/sized_box_empty.dart';
import '../cubit/internet_cubit.dart';

class InternetDependentWidget extends StatelessWidget {
  const InternetDependentWidget(
      {Key? key,
      required this.child,
      this.showAlert = false,
      this.internetFailMessage = 'Internet Disconnected'})
      : super(key: key);
  final bool showAlert;
  final Widget
      child; // Internet bağlantısı olduğunda gösterilmesi istenen widget. Örneğin refresh işlemi yapan bir ikon
  final String
      internetFailMessage; // Internet bağlantısı koptuğunda gösterilen ikaz. Easy localization ile kullanılabilir. Boş gönderilir ise default 'Internet Disconected' ikazı çıkar
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetDisconnected && showAlert) {
          showDisconnected(context);
        }
      },
      builder: (context, state) {
        if (state is InternetConnected) {
          return child; //Eğer internet bağlantısı var ise kendisine gönderilen widgetı gösterir.
        } else if (state is InternetLoading) {
          return const Center(
            child: CircularProgressIndicator
                .adaptive(), //Eğer internet bağlantısı bekleniyor ise Circular Progress Icon gösterir.
          );
        } else {
          return const SizedBoxEmpty(); //Eğer internet bağlantısı yok ise boş sizedbox gösterir.
        }
      },
    );
  }

  void showDisconnected(BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(internetFailMessage)));
  }
}
