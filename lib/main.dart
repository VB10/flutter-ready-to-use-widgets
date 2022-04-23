import 'package:flutter/material.dart';

import 'atomic/container/gradient_container.dart';
import 'atomic/dropdown/example_custom_dropdown.dart';
import 'feature/dropdown/searchable_dropdown_with_paginated_request/example/example.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Material App', home: ExampleCustomDropdown());
  }
}
