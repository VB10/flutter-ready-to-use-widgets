import 'package:flutter/material.dart';

class DataTableRowModel {
  final String name;
  final dynamic value;
  final TextStyle? style;
  final ValueChanged<List<DataTableRowModel>>? onTap;

  DataTableRowModel({
    required this.name,
    required this.value,
    this.style,
    this.onTap,
  });
}
