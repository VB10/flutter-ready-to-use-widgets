import 'package:flutter/material.dart';

class AnimatedCrossTextDemo extends StatelessWidget {
  const AnimatedCrossTextDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedCrossText'),
      ),
      body: Center(
        child: AnimatedCrossText(
          text:
              """Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum""",
          moreText: '...daha fazla gör',
          textStyle: Theme.of(context).textTheme.bodyMedium!,
        ),
      ),
    );
  }
}

class AnimatedCrossText extends StatefulWidget {
  final String text;
  final String moreText;

  final int maxLines;
  final TextStyle textStyle;
  final TextOverflow overflow;
  final EdgeInsets morePadding;

  const AnimatedCrossText({
    Key? key,
    required this.text,
    required this.moreText,
    this.maxLines = 3,
    required this.textStyle,
    this.overflow = TextOverflow.fade,
    this.morePadding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  _AnimatedCrossTextState createState() => _AnimatedCrossTextState();
}

class _AnimatedCrossTextState extends State<AnimatedCrossText> with AutomaticKeepAliveClientMixin {
  bool isExpanded = false;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final text = widget.text;
    TextStyle textStyle = widget.textStyle;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final _textSpan = TextSpan(
          text: text,
          style: textStyle,
        );

        final _textPainter = TextPainter(
          text: _textSpan,
          textDirection: TextDirection.ltr,
          maxLines: widget.maxLines,
        );

        _textPainter.layout(maxWidth: constraints.maxWidth);

        if (_textPainter.didExceedMaxLines) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //
              AnimatedCrossFade(
                firstChild: Text(
                  text,
                  textAlign: TextAlign.start,
                  maxLines: widget.maxLines,
                  overflow: widget.overflow,
                  style: textStyle,
                ),
                secondChild: Text(
                  text,
                  textAlign: TextAlign.start,
                  style: textStyle,
                ),
                crossFadeState: isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                duration: kThemeAnimationDuration,
                firstCurve: Curves.linear,
              ),

              //
              if (!isExpanded) ...[
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      if (!mounted) return;

                      setState(() {
                        isExpanded = true;
                      });
                    },
                    child: Padding(
                      padding: widget.morePadding,
                      child: Text(
                        widget.moreText,
                        style: textStyle,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          );
        } else {
          return Text(
            text,
            style: textStyle,
          );
        }
      },
    );
  }
}
