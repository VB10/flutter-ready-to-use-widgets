import 'package:flutter/material.dart';
import 'package:ready_to_use_widgets/atomic/wide_expansion_panel/wide_expansion_panel_list.dart';

class WideExpansionPanel extends StatelessWidget {
  const WideExpansionPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          WideExpansionPanelList(
            data: [
              Data(expandedValue: 'expandedValue', headerValue: 'headerValue')
            ],
            key: null,
          ),
        ],
      ),
    );
  }
}
