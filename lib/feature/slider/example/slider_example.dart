import 'package:flutter/material.dart';
import 'package:ready_to_use_widgets/feature/slider/slider.dart';

class SliderExample extends StatefulWidget {
  const SliderExample({Key? key}) : super(key: key);

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox.expand(
        child: Center(
          child: WidgetSlider(
            children: List.generate(
              4,
              (index) => Container(
                color: _initContianerColor(index),
                width: (index == 0 ? 25 : 25 * index).toDouble(),
                height: (index == 0 ? 25 : 25 * index).toDouble(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color _initContianerColor(int index) {
    switch (index) {
      case 0:
        return Colors.red;
      case 1:
        return Colors.blue;
      case 2:
        return Colors.yellow;
      case 3:
        return Colors.green;

      default:
        return Colors.red;
    }
  }
}
