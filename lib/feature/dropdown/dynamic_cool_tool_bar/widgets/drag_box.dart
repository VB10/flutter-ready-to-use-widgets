import 'package:flutter/material.dart';

class DragBox extends StatefulWidget {
  final Offset initPosition;
  final Widget child;

  const DragBox({
    Key? key,
    required this.initPosition,
    required this.child,
  }) : super(key: key);

  @override
  State<DragBox> createState() => _DragBoxState();
}

class _DragBoxState extends State<DragBox> {
  Offset position = const Offset(0, 0);

  @override
  void initState() {
    super.initState();
    position = widget.initPosition;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: Draggable<String>(
        child: widget.child,
        feedback: widget.child,
        onDraggableCanceled: (velocity, offset) {
          setState(() {
            position = offset;
          });
        },
      ),
    );
  }
}
