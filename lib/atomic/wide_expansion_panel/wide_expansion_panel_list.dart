import 'package:flutter/material.dart';
import 'package:ready_to_use_widgets/atomic/wide_expansion_panel/wide_expansion_panel.dart';

class WideExpansionPanelList extends StatefulWidget {
  final List<Data> data;
  const WideExpansionPanelList({Key? key, required this.data}) : super(key: key);

  @override
  State<WideExpansionPanelList> createState() =>
      _WideExpansionPanelListState();
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
      child: DataTable(columns: const [
        DataColumn(
          label: Text(
            'Kontrol',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'Durum',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'Ürün Kodu',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'İş Adı',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'İş Id',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'Revizyon',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ], rows: [
        DataRow(
          cells: <DataCell>[
            DataCell(Checkbox(
              value: true,
              onChanged: (value) {},
            )),
            const DataCell(Text('Stokta')),
            const DataCell(Text('4564564564')),
            const DataCell(Text('GIDA REGULASYON_SOGUTUCU')),
            const DataCell(Text('5247')),
            const DataCell(Text('')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Checkbox(
              value: false,
              onChanged: (value) {},
            )),
            const DataCell(Text('Stokta')),
            const DataCell(Text('4564564564')),
            const DataCell(Text('GIDA REGULASYON_SOGUTUCU')),
            const DataCell(Text('5247')),
            const DataCell(Text('')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Checkbox(
              value: false,
              onChanged: (value) {},
            )),
            const DataCell(Text('Stokta')),
            const DataCell(Text('4564564564')),
            const DataCell(Text('GIDA REGULASYON_SOGUTUCU')),
            const DataCell(Text('5247')),
            const DataCell(Text('')),
          ],
        ),
      ]),
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
