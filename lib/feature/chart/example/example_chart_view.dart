import 'package:flutter/material.dart';
import 'package:ready_to_use_widgets/core/init/constants/color_constant.dart';

import '../base_chart.dart';

class ExampleChartView extends StatelessWidget {
  const ExampleChartView({Key? key}) : super(key: key);

  final String _csvPath = '/Users/...../example/ChartCSV.csv';
  final String xAxisName = 'Day';
  final String yAxisName = 'Money';
  final String title = 'Money of Days';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: BaseChart(
            pathCSV: _csvPath,
            chartColor: ColorConstants.fruitSalad,
            xAxisName: xAxisName,
            yAxisName: yAxisName,
            title: title,
          ),
        ),
      ),
    );
  }
}
