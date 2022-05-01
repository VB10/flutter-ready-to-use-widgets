import 'package:flutter/material.dart';

final buttonStyle = ButtonStyle(
  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
  backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 229, 78, 118)),
  minimumSize: MaterialStateProperty.all(const Size(200, 50)),
);

class AsynchronousButton extends StatefulWidget {
  const AsynchronousButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
    this.padding,
  }) : super(key: key);

  final Future<void> Function() onPressed;
  final String buttonText;
  final EdgeInsets? padding;

  @override
  State<AsynchronousButton> createState() => _AsynchronousButtonState();
}

class _AsynchronousButtonState extends State<AsynchronousButton> {
  
  bool _isButtonBusy = false;
  void _updateButtonState() => setState(() => _isButtonBusy = !_isButtonBusy);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: () async {
          if (_isButtonBusy) return;
          _updateButtonState();
          await widget.onPressed();
          _updateButtonState();
        },
        child: Center(child: _isButtonBusy ? const _BusyWidget() : _ButtonText(buttonText: widget.buttonText)),
        style: buttonStyle,
      ),
    );
  }
}

class _BusyWidget extends StatelessWidget {
  const _BusyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(color: Colors.white);
  }
}

class _ButtonText extends StatelessWidget {
  const _ButtonText({
    Key? key,
    required this.buttonText,
  }) : super(key: key);

  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Text(
      buttonText,
      style: const TextStyle(color: Colors.white),
      textAlign: TextAlign.center,
    );
  }
}

extension AsynchronousButtonExtension on AsynchronousButton {
  Widget disableBusyState(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Center(child: _ButtonText(buttonText: buttonText)),
        style: buttonStyle,
      ),
    );
  }
}
