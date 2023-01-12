import 'package:flutter/material.dart';
import 'package:ready_to_use_widgets/atomic/wide_expansion_panel/wide_expansion_panel.dart';
import 'package:ready_to_use_widgets/core/init/extensions/context_extension.dart';

class WideExpansionPanelList extends StatefulWidget {
  final List<Data> data;
  final String? kontrolText;
  final String? durumText;
  final String? urunKoduText;
  final String? isAdiText;
  final String? isIdText;
  final String? revizyonText;
  const WideExpansionPanelList(
      {Key? key,
      required this.data,
      this.kontrolText,
      this.durumText,
      this.urunKoduText,
      this.isAdiText,
      this.isIdText,
      this.revizyonText})
      : super(key: key);

  @override
  State<WideExpansionPanelList> createState() => _WideExpansionPanelListState();
}

class _WideExpansionPanelListState extends State<WideExpansionPanelList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: ExpansionPanelList(
            expansionCallback: (panelIndex, isExpanded) {
              setState(() {
                widget.data[panelIndex].isExpanded = !isExpanded;
              });
            },
            children: widget.data.map<ExpansionPanel>((dynamic item) {
              return wideExpansionPanel(
                  body: buildDataTable(), isExpanded: item.isExpanded);
            }).toList(),
          ),
        ),
      ),
    );
  }

  buildDataTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(columns: [
        DataColumn(
          label: Text(widget.kontrolText.toString(),
              style: context.appTheme().wideExpansionPanelTextStyle),
        ),
        DataColumn(
          label: Text(widget.durumText.toString(),
              style: context.appTheme().wideExpansionPanelTextStyle),
        ),
        DataColumn(
          label: Text(widget.urunKoduText.toString(),
              style: context.appTheme().wideExpansionPanelTextStyle),
        ),
        DataColumn(
          label: Text(widget.isAdiText.toString(),
              style: context.appTheme().wideExpansionPanelTextStyle),
        ),
        DataColumn(
          label: Text(widget.isIdText.toString(),
              style: context.appTheme().wideExpansionPanelTextStyle),
        ),
        DataColumn(
          label: Text(widget.revizyonText.toString(),
              style: context.appTheme().wideExpansionPanelTextStyle),
        ),
      ], rows: [
        buildDataRow(),
        buildDataRow(),
        buildDataRow(),
      ]),
    );
  }

  DataRow buildDataRow() {
    return DataRow(
      cells: <DataCell>[
        DataCell(Checkbox(
          value: false,
          onChanged: (value) {},
        )),
        const DataCell(Text('Stokta')),
        const DataCell(Text('4564564564')),
        const DataCell(Text('GIDA REGULASYON_SOGUTUCU')),
        const DataCell(Text('5247')),
        const DataCell(Text('50')),
      ],
    );
  }
}

class Data {
  Data({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}
