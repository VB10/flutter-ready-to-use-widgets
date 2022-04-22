import 'package:flutter/material.dart';
import 'package:ready_to_use_widgets/atomic/container/gradient_container.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: GradientContainer(
              context: context,
              child: const SizedBox(
                height: 200,
                width: 100,
              )),
        ),
      ),
    );
  }
}
