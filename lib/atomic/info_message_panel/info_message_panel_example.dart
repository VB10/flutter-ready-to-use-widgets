import 'package:flutter/material.dart';
import 'package:ready_to_use_widgets/atomic/info_message_panel/info_message_panel_widget.dart';
import 'package:ready_to_use_widgets/core/init/constants/color_constant.dart';

class InfoMessagePanelExample extends StatelessWidget {
  const InfoMessagePanelExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InfoMessagePanel(
              borderColor: ColorConstants.casablanca,
              icon: const Icon(Icons.info),
              isClosable: true,
              message:
                  'Installation: If an anti-virus application scan is running, programs may not install and an error message appears.',
              messageWidget: Column(
                children: const [],
              ),
              elevation: 1,
            )
          ],
        ),
      ),
    );
  }
}
