
import 'package:flutter/material.dart';

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
            backgroundColor: Colors.white70,
            value: progress,
            color: color,
            strokeWidth: 3.0,
          ),
        ),
      ],
    );
  }
}
