import 'package:flutter/material.dart';
import 'package:ready_to_use_widgets/feature/chart/file_manager.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'base_chart_model.dart';

class BaseChart extends StatefulWidget {
  const BaseChart(
      {Key? key,
      required this.pathCSV,
      required this.xAxisName,
      required this.yAxisName,
      required this.chartColor,
      required this.title})
      : super(key: key);
  final String pathCSV;
  final String xAxisName;
  final String yAxisName;
  final Color chartColor;
  final String title;
  @override
  State<BaseChart> createState() => _TotalChartState();
}

class _TotalChartState extends State<BaseChart> {
  List<BaseChartModel> dataList = [];

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getDataFromCSV();
  }

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  void getDataFromCSV() {
    changeLoading();
    dataList = FileManager.getDatas(
      widget.pathCSV,
      () {
        /// Dosya okuma işlemi bittiğinde çalışacak kodlar
        changeLoading();
      },
      (error) {
        /// Error olma durumunda çalışacak kodlar
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            title: ChartTitle(text: widget.title),
            series: <ChartSeries<BaseChartModel, int>>[
              AreaSeries(
                dataSource: dataList,
                xValueMapper: (BaseChartModel model, _) => model.xValue,
                yValueMapper: (BaseChartModel model, _) => model.yValue,
                color: widget.chartColor,
                xAxisName: widget.xAxisName,
                yAxisName: widget.yAxisName,
              ),
            ],
          );
  }
}
