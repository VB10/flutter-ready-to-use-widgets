import 'package:flutter/material.dart';
import 'package:ready_to_use_widgets/atomic/custom_animated/item_card_widget.dart';
import 'package:ready_to_use_widgets/core/init/constants/color_constant.dart';

class CustomAnimated extends StatefulWidget {
  const CustomAnimated({Key? key}) : super(key: key);

  @override
  State<CustomAnimated> createState() => _CustomAnimatedState();
}

class _CustomAnimatedState extends State<CustomAnimated> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: AppBar(title: const Text('İşlerim')),
      body: Column(
        children: [
          ItemCardWidget(
            buttons: [
              ItemCardButton(buttonText: 'İşi Tamamla', onPressed: () {}),
              ItemCardButton(
                  buttonText: 'Detay',
                  isPrimary: false,
                  onPressed: () {},
                  backgroundColor: ColorConstants.steelGray),
            ],
            cardLines: const [
              CardLine(title: 'Title', value: 'Value', index: 0),
              CardLine(title: 'Title', value: 'Value', index: 0),
              CardLine(title: 'Title', value: 'Value', index: 0),
              CardLine(title: 'Title', value: 'Value', index: 0),
              CardLine(title: 'Title', value: 'Value', index: 0),
              CardLine(title: 'Title', value: 'Value', index: 0),
              CardLine(title: 'Title', value: 'Value', index: 0),
            ],
          ),
        ],
      ),
    );
  }
}
