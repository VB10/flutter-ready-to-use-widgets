import 'package:flutter/material.dart';
import 'package:ready_to_use_widgets/feature/chart/example/example_chart_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Material App', home: ExampleChartView());
  }
}
