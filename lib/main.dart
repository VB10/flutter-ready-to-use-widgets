import 'package:flutter/material.dart';

import 'atomic/button/custom_elevated_button.dart';
import 'atomic/container/gradient_container.dart';
import 'feature/dropdown/searchable_dropdown_with_paginated_request/example/example.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              GradientContainer(
                context: context,
                child: const SizedBox(
                  height: 200,
                  width: 100,
                ),
              ),
              const SearchAbleDropdownWithPagintedRequestExample(),

              CustomElevatedButton(
                color: Colors.red,
                height: 50,
                width: 200,
                borderRadius: 20,
                onPressed: () {},
                child: const Text("Custom Button")),
            ],
          ),
        ),
      ),
    );
  }
}
