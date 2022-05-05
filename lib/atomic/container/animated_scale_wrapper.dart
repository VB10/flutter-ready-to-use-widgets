import 'package:flutter/material.dart';

class AnimatedScaleWrapper extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;

  const AnimatedScaleWrapper({
    Key? key,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  @override
  _AnimatedScaleWrapperState createState() => _AnimatedScaleWrapperState();
}

class _AnimatedScaleWrapperState extends State<AnimatedScaleWrapper> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  bool isDown = false;
  double scale = 1.0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      lowerBound: 0.90,
      upperBound: 1.0,
      duration: const Duration(milliseconds: 60),
    );
    _animationController.addListener(() {
      if (mounted) {
        setState(() {
          scale = _animationController.value;
        });
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          widget.onTap();
        },
        onTapDown: (_) {
          _onTapDown();
        },
        onTapUp: (_) {
          _onTapUp();
        },
        onTapCancel: () {
          _onTapCancel();
        },
        child: widget.child,
      ),
    );
  }

  void _onTapDown() {
    isDown = true;
    _animationController.reverse(from: _animationController.upperBound);
  }

  Future _onTapUp() async {
    isDown = false;
    if (!isDown) {
      await _animationController.forward(from: _animationController.value);
    }
  }

  Future _onTapCancel() async {
    isDown = false;
    if (!isDown) {
      await _animationController.forward(from: _animationController.value);
    }
  }
}
