import 'package:flutter/material.dart';
import 'package:ready_to_use_widgets/feature/face_pile/face_pile_stack.dart';

class FacePileExample extends StatelessWidget {
  const FacePileExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> urls = List.generate(5, (index) => "https://i.pravatar.cc/300");
    return Scaffold(
      backgroundColor: Colors.black,
      body: FaceStack(
        width: 36,
        offsetValue: 0.4,
        borderWidth: 1,
        borderColor: Colors.white,
        urls: urls,
      ),
    );
  }
}
