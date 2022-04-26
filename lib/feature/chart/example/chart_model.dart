import '../base_chart_model.dart';

class ChartModel extends BaseChartModel {
  final int day;
  final int money;

  ChartModel({required this.day, required this.money}) : super(xValue: day, yValue: money);
}
