import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ready_to_use_widgets/atomic/container/gradient_container.dart';
import 'feature/internet_connection/cubit/internet_cubit.dart';
import 'feature/internet_connection/view/internet_dependent_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const AppBlocProvider(),
  );
}

class AppBlocProvider extends StatelessWidget {
  const AppBlocProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<InternetCubit>(
        //Uygulamanın herhangi bir yerinde bloc vasıtasıyla internet kontrol edilip işlem yapılabilir.
        lazy: false,
        create: (context) => InternetCubit(
          connectionChecker:
              InternetConnectionChecker(), //Internet durumunu burada tüm uygulama kullanımı için servis ediyoruz. Kullandığımız paket ayarları gerekli görülürse değiştirilebilir.
        ),
      ),
    ], child: const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final String internetConnected = 'Internet Connected';
  final String internetDisconnected = 'Internet Bağlantısı Kesildi';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: Column(
            children: [
              GradientContainer(
                context: context,
                child: const SizedBox(
                  height: 200,
                  width: 100,
                ),
              ),
              InternetDependentWidget(
                child: Text(
                    internetConnected), // Internet bağlantısı olup olmasına göre gösterilen widget.
                showAlert:
                    true, //Internet bağlantısı olmadığında snackbar gösterimine olanak sağlar.
                internetFailMessage: internetDisconnected,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
