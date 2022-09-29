import 'package:flutter/material.dart';
import 'package:ready_to_use_widgets/core/init/constants/color_constant.dart';
import 'package:ready_to_use_widgets/core/init/extensions/context_extension.dart';

class InfoMessagePanel extends StatefulWidget {
  final String message;
  final dynamic icon;
  final bool? isClosable;
  final double? elevation;
  final Widget? messageWidget;
  final bool? showBorder;
  final Color? borderColor;
  final bool? showIcon;

  const InfoMessagePanel({
    Key? key,
    required this.message,
    this.icon,
    this.isClosable = false,
    this.elevation = 0,
    this.messageWidget,
    this.showBorder = true,
    this.borderColor,
    this.showIcon = true,
  }) : super(key: key);

  @override
  _InfoMessagePanelState createState() => _InfoMessagePanelState();
}

class _InfoMessagePanelState extends State<InfoMessagePanel> {
  bool _show = true;
  Duration animationDuration = const Duration(milliseconds: 400);

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: animationDuration,
      sizeCurve: Curves.easeInOutQuart,
      firstCurve: Curves.easeInOutQuart,
      secondCurve: Curves.easeInOutQuart,
      crossFadeState:
          _show ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      firstChild: Container(),
      secondChild: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: context.dynamicHeight(0.01)),
                child: Material(
                  color: ColorConstants.transparent,
                  elevation: widget.elevation!,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: ColorConstants.transparent,
                        borderRadius: BorderRadius.circular(10),
                        border: ((widget.showBorder ?? false) == false)
                            ? null
                            : Border.all(
                                color: widget.borderColor ??
                                    ((widget.icon != null && widget is Icon
                                            ? (widget.icon.color ??
                                                ColorConstants.mercury)
                                            : ColorConstants.mercury))
                                        .withAlpha(80),
                                style: BorderStyle.solid,
                              )),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          !widget.showIcon!
                              ? Container()
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: widget.icon ??
                                      const Icon(
                                        Icons.info,
                                        color: ColorConstants.casablanca,
                                      ),
                                ),
                          Expanded(
                            child: widget.message == null
                                ? widget.messageWidget!
                                : Text(
                                    widget.message,
                                    softWrap: true,
                                    style: context
                                        .appTheme()
                                        .infoMessagePanelTextStyle,
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              widget.isClosable == false
                  ? Container()
                  : Positioned(
                      top: 8,
                      right: 8,
                      child: ClipOval(
                        child: Material(
                          color: ColorConstants.errorColor, // Button color
                          child: InkWell(
                            splashColor:
                                ColorConstants.primaryColor, // Splash color
                            onTap: () {
                              setState(() {
                                _show = false;
                              });
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(3.0),
                              child: Icon(
                                Icons.close_outlined,
                                color: ColorConstants.secondaryColor,
                                size: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
            ],
          ),
        ],
      ),
    );
  }
}
