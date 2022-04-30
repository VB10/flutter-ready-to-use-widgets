import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'atomic/dropdown/example_custom_dropdown.dart';
import 'feature/network_connection/cubit/network_cubit.dart';

void main() => runApp(const AppBlocProvider());

import 'package:ready_to_use_widgets/feature/chart/example/example_chart_view.dart';


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

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(title: 'Material App', home: ExampleChartView());

  }
}
