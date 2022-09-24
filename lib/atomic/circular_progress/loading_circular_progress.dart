import 'package:flutter/material.dart';
import 'package:ready_to_use_widgets/core/init/constants/color_constant.dart';

class LoadingCircular extends StatelessWidget {
  final dynamic progress;
  final double width;
  final double height;
  bool isLoading;

  final Color? color;
  LoadingCircular({
    Key? key,
    this.color,
    this.isLoading = false,
    required this.progress,
    required this.width,
    required this.height,
  }) : super(key: key);

  int get _progress => (progress * 100.0).toInt();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        isLoading ? const Icon(Icons.done) : Text('$_progress%'),
        SizedBox(
          width: width,
          height: height,
          child: CircularProgressIndicator(
            backgroundColor: ColorConstants.white70,
            value: progress,
            color: color,
            strokeWidth: 3.0,
          ),
        ),
      ],
    );
  }
}



/* 


HOW TO USE ? 

- void _incrementCounter() async {
    for (var x = 0; x < 10; x++) {
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        _counter++;
      });
    }
  }

  you need to define your func for loading. 
  after this you can call button or initstate for page loading. 
LoadingCircular(
            isLoading: _counter * 10 == 100 ? true : false,
            color: _counter * 10 == 100 ? Colors.green : Colors.blueAccent,
            progress: _counter / 10,
            width: 100,
            height: 100),

            */