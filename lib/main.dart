import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ready_to_use_widgets/atomic/info_message_panel/info_message_panel_example.dart';
import 'package:ready_to_use_widgets/view/future_navigate.dart';
import 'package:ready_to_use_widgets/atomic/glow_image/example_glow_image.dart';
import 'package:ready_to_use_widgets/atomic/rating_bar/extension/rating_bar_icon_extension.dart';
import 'package:ready_to_use_widgets/atomic/rating_bar/rating_bar.dart';
import 'atomic/beauty_textfield/beauty_textfield.dart';
import 'atomic/button/asynchronous_button.dart';
import 'atomic/custom_animated/example_animated.dart';
import 'atomic/dropdown/example_custom_dropdown.dart';
import 'atomic/group_checkbox/example/group_checkbox_example_view.dart';
import 'atomic/text/animated_cross_text.dart';

import 'feature/network_connection/cubit/network_cubit.dart';

void main() => runApp(const AppBlocProvider());

class AppBlocProvider extends StatelessWidget {
  const AppBlocProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<NetworkCubit>(
        //Uygulamanın herhangi bir yerinde bloc vasıtasıyla internet kontrol edilip işlem yapılabilir.
        // Network status can be checked anywhere in the app
        lazy: false,
        create: (context) => NetworkCubit(
          connectionChecker:
              InternetConnectionChecker(), //Internet durumunu burada tüm uygulama kullanımı için servis ediyoruz. Kullandığımız paket ayarları gerekli görülürse değiştirilebilir.
        ), //Network status monitored and serviced to app
      ),
    ], child: const MyApp());
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Material App', home: CustomAnimated());
  }
}
