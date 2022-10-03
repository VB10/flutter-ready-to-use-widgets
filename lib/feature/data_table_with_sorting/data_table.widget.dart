import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:/lib/feature/data_table_with_sorting/data_table_row.dart';

class DataTableWidget extends StatefulWidget {
  final List<List<DataTableRowModel>> listOfColumns;

  const DataTableWidget({
    super.key,
    required this.listOfColumns,
  });

  @override
  State<DataTableWidget> createState() => _DataTableWidgetState();
}

class _DataTableWidgetState extends State<DataTableWidget> {
  List<List<DataTableRowModel>> innerList = [];

  @override
  void initState() {
    innerList = [...widget.listOfColumns];
    super.initState();
  }

  int sortColumnIndex = 0;
  bool isAscending = false;
  int compareValues(
    bool ascending,
    var value1,
    var value2,
  ) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);

  void onSort(int columnIndex, bool ascending) {
    innerList.sort(
      (a, b) => compareValues(
        ascending,
        a.elementAt(columnIndex).value,
        b.elementAt(columnIndex).value,
      ),
    );
    setState(() {
      sortColumnIndex = columnIndex;
      isAscending = ascending;
    });
  }

  DataRow2 _cellGenerator(List<DataTableRowModel> row) {
    return DataRow2(
      cells: row
          .map(
            (cell) => DataCell(
              Text(
                cell.value.toString(),
                style: cell.style ??
                    const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                maxLines: 1,
              ),
              onTap: cell.onTap != null ? () => cell.onTap!(row) : null,
            ),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: 550,
        child: DataTable2(
          sortAscending: isAscending,
          sortColumnIndex: sortColumnIndex,
          columnSpacing: 5,
          columns: innerList.first.map((e) => DataColumn2(onSort: onSort, label: Text(e.name))).toList(),
          rows: innerList.map((e) => _cellGenerator(e)).toList(),
        ),
      ),
    );
  }
}
