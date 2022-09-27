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
            kontrolText: 'Kontrol',
            durumText: 'Durum',
            isAdiText: 'İş Adı',
            isIdText: 'İş ID',
            revizyonText: 'Revizyon',
            urunKoduText: 'Ürün Kodu',
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
