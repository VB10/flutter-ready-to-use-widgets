import 'package:flutter/material.dart';

import 'glow_image.dart';

class ExampleGlowImage extends StatefulWidget {
  const ExampleGlowImage({Key? key}) : super(key: key);

  @override
  State<ExampleGlowImage> createState() => _ExampleGlowImageState();
}

class _ExampleGlowImageState extends State<ExampleGlowImage> {
  bool tapped = true;

  @override
  Widget build(BuildContext context) {
    const _width = 300.0;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () => setState(() {
                  tapped = !tapped;
                }),
                child: AnimatedContainer(
                  curve: Curves.easeInOutBack,
                  width: tapped ? _width : _width * 0.8,
                  duration: const Duration(milliseconds: 450),
                  child: GlowImage(
                    child: const Photo()
                    // Container(
                    //   width: _width,
                    //   color: Colors.green,
                    //   height: _width,
                    // )
                    ,
                    blurOpacity: tapped ? 1 : 0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Photo extends StatelessWidget {
  const Photo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://raw.githubusercontent.com/philipcdavis/swiftui-photoTintedShadows-example/main/Glow/Assets.xcassets/shot.imageset/shot.png',
    );
  }
}
