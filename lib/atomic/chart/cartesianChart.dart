import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartDataWidget extends StatefulWidget {
  final List<ChartData> chartData;

  const ChartDataWidget({
    Key? key,
    required this.chartData,
  }) : super(key: key);

  @override
  State<ChartDataWidget> createState() => _ChartDataWidgetState();
}

class _ChartDataWidgetState extends State<ChartDataWidget> {
  double price = 0;

  onPointerChanged(double pointer) {
    Future.delayed(Duration.zero, () {
      setState(() {
        this.pointer = pointer;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chart"),
      ),
      body: Center(
        child: Column(children: [
          Stack(
            children: [
              Container(
                width: 30,
                height: 20,
                color: Colors.grey,
                child: Text(price.toString()),
              ),
              SizedBox(
                height: 210,
                child: SfCartesianChart(
                  trackballBehavior: TrackballBehavior(
                    enable: true,
                    activationMode: ActivationMode.singleTap,
                    shouldAlwaysShow: true,
                    markerSettings: const TrackballMarkerSettings(
                      markerVisibility: TrackballVisibilityMode.visible,
                    ),
                    tooltipAlignment: ChartAlignment.near,
                    tooltipDisplayMode: TrackballDisplayMode.groupAllPoints,
                    tooltipSettings: const InteractiveTooltip(connectorLineWidth: 0),
                    builder: (context, trackballDetails) {
                      price = (trackballDetails.groupingModeInfo!.points.first.y * 100).round() / 100;
                      onPointerChanged(price);
                      return Container();
                    },
                  ),
                  margin: const EdgeInsets.all(0),
                  plotAreaBorderWidth: 0,
                  primaryXAxis: DateTimeCategoryAxis(
                    interval: 60,
                    majorGridLines: MajorGridLines(
                      dashArray: const [3, 3],
                      width: 1,
                      color: const Color(0xffe6ebed),
                    ),
                    axisLine: AxisLine(
                      width: 0,
                      color: const Color(0xffe6ebed),
                    ),
                    majorTickLines: const MajorTickLines(width: 0),
                    isVisible: true,
                  ),
                  primaryYAxis: NumericAxis(
                    isVisible: true,
                  ),
                  zoomPanBehavior: ZoomPanBehavior(
                    enablePanning: true,
                    enablePinching: true,
                    zoomMode: ZoomMode.x,
                  ),
                  series: [
                    AreaSeries(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xffe6ebed),
                          Color(0xfffcfcfd),
                        ],
                        stops: [0, 1],
                      ),
                      borderWidth: 2,
                      borderColor: const Color(0xff0077b6),
                      borderDrawMode: BorderDrawMode.top,
                      dataSource: widget.chartData,
                      xValueMapper: (ChartData data, _) => data.y!,
                      yValueMapper: (ChartData data, _) => data.x,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
