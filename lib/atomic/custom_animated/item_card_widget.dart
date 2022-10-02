// ignore_for_file: must_be_immutable, library_private_types_in_public_api

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ready_to_use_widgets/atomic/large_button.dart/custom_large_button.dart';
import 'package:ready_to_use_widgets/core/init/constants/color_constant.dart';
import 'package:ready_to_use_widgets/core/init/extensions/context_extension.dart';


class ItemCardWidget extends StatefulWidget {
  final int minShowItemCount;
  final List<CardLine> cardLines;
  final Duration animationDuration;
  final Curve animationCurve = Curves.easeInOutCubic;
  final List<ItemCardButton> buttons;
   bool isExpanded;

  ItemCardWidget(
      {Key? key,
      this.isExpanded = false,
      this.minShowItemCount = 3,
      required this.cardLines,
      this.animationDuration = const Duration(milliseconds: 180),
      required this.buttons})
      : super(key: key);

  @override
  _ItemCardWidgetState createState() => _ItemCardWidgetState();
}

class _ItemCardWidgetState extends State<ItemCardWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this,
        duration: widget.animationDuration,
        lowerBound: 0,
        upperBound: 180);
    _animation = CurvedAnimation(
        parent: _animationController,
        curve: widget.animationCurve,
        reverseCurve: widget.animationCurve);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Material(
          elevation: 4,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) => Container(
                padding: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildCardLines(),
                    Column(
                      children: [
                        buttonGroup(widget.buttons),
                        buildExpandButton(),
                      ],
                    )
                  ],
                )),
          )),
    );
  }

  AnimatedCrossFade buildCardLines() {
    return AnimatedCrossFade(
        firstCurve: widget.animationCurve,
        secondCurve: widget.animationCurve,
        sizeCurve: widget.animationCurve,
        firstChild: buildCardLinesColumn(),
        secondChild: buildCardLinesColumn(),
        crossFadeState: widget.isExpanded
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        duration: widget.animationDuration);
  }

  AnimatedBuilder buildExpandButton() {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) => ClipOval(
        child: Material(
          color: Colors.white,
          child: InkWell(
            onTap: () {
              if (widget.isExpanded) {
                _animationController.reverse();
                widget.isExpanded = false;
              } else {
                _animationController.forward();
                widget.isExpanded = true;
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Transform.rotate(
                origin: const Offset(0.5, 0.5),
                angle: _animationController.value * pi / 180,
                child: const Icon(Icons.keyboard_arrow_down_outlined,
                    color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column buildCardLinesColumn() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: widget.isExpanded
          ? widget.cardLines
          : widget.cardLines.sublist(
              0,
              (widget.minShowItemCount < widget.cardLines.length
                  ? widget.minShowItemCount
                  : widget.cardLines.length)),
    );
  }

  Widget buttonGroup(List<ItemCardButton> buttons) {
    List<Widget> widgetList = [];
    buttons.forEach((element) {
      widgetList.add(
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: element,
        )),
      );
    });

    return Container(
      padding: const EdgeInsets.only(
        top: 4,
        left: 16,
        right: 16,
      ),
      child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: widgetList),
    );
  }
}

class ItemCardButton extends StatelessWidget {
  final Color? backgroundColor;
  final bool isPrimary;
  final String? buttonText;
  final VoidCallback? onPressed;

  const ItemCardButton({
    Key? key,
    this.isPrimary = true,
    this.buttonText,
    this.onPressed,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LargeButton(
      text: buttonText.toString(),
      style: context.appTheme().itemCardWidgetTextStyle,
      backgroundColor: isPrimary ? ColorConstants.blueGray : backgroundColor,
      isOutlined: true,
      onPressed: onPressed,
    );
  }
}

class CardLine extends StatelessWidget {
  const CardLine({
    Key? key,
    required this.title,
    required this.value,
    required this.index,
  }) : super(key: key);

  final String title;
  final String value;
  final int index;

  final _listBottomLeftTextStyle = const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black);
  final _listBottomRightTextStyle =
      const TextStyle(fontSize: 14, color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 4,
        left: 16,
        right: 16,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: _listBottomLeftTextStyle,
          ),
          SizedBox(
            // width: MediaQuery.of(context).size.width*0.4,
            child: Text(
              value,
              style: _listBottomRightTextStyle,
              textAlign: TextAlign.right,
            ),
          )
        ],
      ),
    );
  }
}
