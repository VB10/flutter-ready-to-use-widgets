import 'dart:async';

import 'package:flutter/material.dart';

class WidgetSlider extends StatefulWidget {
  /// To pass children to this widget.
  final List<Widget> children;

  /// Spacing between each child.
  /// Default spacing is 10.0
  final double? spacing;

  /// Sliding speed applied to widget every 100ms, for smooth transition lower values are recommended.
  /// Default offset x = 10.0
  final double? slidingSpeed;

  /// Sliding direction.
  /// Default is Axis.horizontal
  final Axis? slideAxis;

  /// Sliding child count
  /// Default is 100m
  final int? slideCount;

  const WidgetSlider({
    Key? key,
    required this.children,
    this.spacing,
    this.slidingSpeed,
    this.slideAxis,
    this.slideCount,
  }) : super(key: key);

  @override
  State<WidgetSlider> createState() => _WidgetSliderState();
}

class _WidgetSliderState extends State<WidgetSlider> {
  late ScrollController _sliderController;
  late Timer _sliderTimer;
  final Duration _updateDuration = const Duration(milliseconds: 100);
  final int _defaultSlideCount = 1000000000;

  @override
  void initState() {
    assert(widget.children.length > 1);
    _sliderController = ScrollController(initialScrollOffset: 0);
    _sliderTimer = _assignTimer();
    super.initState();
  }

  @override
  void dispose() {
    _sliderController.dispose();
    _sliderTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: true,
      child: ListView.separated(
        controller: _sliderController,
        shrinkWrap: true,
        physics: null,
        itemCount: widget.slideCount ?? _defaultSlideCount,
        cacheExtent: MediaQuery.of(context).size.width,
        scrollDirection: widget.slideAxis ?? Axis.horizontal,
        itemBuilder: (context, index) {
          return widget.children[index % widget.children.length];
        },
        separatorBuilder: (context, index) {
          if (widget.slideAxis == null) return SizedBox(width: widget.spacing ?? 10);
          return widget.slideAxis == Axis.horizontal ? SizedBox(width: widget.spacing ?? 10) : SizedBox(height: widget.spacing ?? 10);
        },
      ),
    );
  }

  Timer _assignTimer() {
    return Timer.periodic(
      _updateDuration,
      (_) {
        _sliderController.animateTo(
          _sliderController.offset + (widget.slidingSpeed ?? 10),
          duration: _updateDuration,
          curve: Curves.linear,
        );
      },
    );
  }
}
