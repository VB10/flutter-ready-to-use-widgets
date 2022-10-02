import 'package:flutter/material.dart';
import 'package:ready_to_use_widgets/feature/circle_avatar_image_and_alphabet/circle_avatar_image_and_alphabet_example/circle_avatar_image_and_alphabet_example_view_model.dart';
import 'package:ready_to_use_widgets/utils/navigate/goToView.dart';

import '../atomic/dropdown/example_custom_dropdown.dart';
import '../atomic/group_checkbox/example/group_checkbox_example_view.dart';
import '../feature/bottomlistpicker/example/bottomlistpicker_example.dart';
import '../feature/chart/example/example_chart_view.dart';
import '../feature/circle_avatar_image_and_alphabet/circle_avatar_image_and_alphabet_example/circle_avatar_image_and_alphabet_example_view.dart';
import '../feature/dropdown/dynamic_cool_tool_bar/example/dynamic_cool_tool_bar.dart';
import '../feature/dropdown/searchable_dropdown_with_paginated_request/example/example.dart';
import '../feature/network_connection/network_dependent_widget_example.dart';
import '../feature/widget_slider/example/slider_example.dart';

class FutureNavigateView extends StatefulWidget {
  const FutureNavigateView({Key? key}) : super(key: key);

  @override
  State<FutureNavigateView> createState() => _FutureNavigateViewState();
}

class _FutureNavigateViewState extends State<FutureNavigateView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Future Navigate View"), centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Center(
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              ElevatedButton(
                  onPressed: () {
                    goToView(context, const BottomListPickerExample());
                  },
                  child: const Text("Bottom List Picker Example")),
              ElevatedButton(
                  onPressed: () {
                    goToView(context, const ExampleChartView());
                  },
                  child: const Text("Example Chart View")),
              ElevatedButton(
                  onPressed: () {
                    goToView(context, const DynamicCoolToolBar());
                  },
                  child: const Text("Dynamic Cool ToolBar")),
              ElevatedButton(
                  onPressed: () {
                    goToView(context, const SearchAbleDropdownWithPagintedRequestExample());
                  },
                  child: const Text(
                    "Search Able Dropdown With \nPaginted Request Example",
                    textAlign: TextAlign.center,
                  )),
              ElevatedButton(
                  onPressed: () {
                    goToView(context, const NetworkDependentWidgetExample());
                  },
                  child: const Text("Network Dependent Widget Example")),
              ElevatedButton(
                  onPressed: () {
                    goToView(context, const WidgetSliderExample());
                  },
                  child: const Text("Widget Slider Example")),
              ElevatedButton(
                  onPressed: () {
                    goToView(context, const ExampleCustomDropdown());
                  },
                  child: const Text("Example Custom Dropdown")),
              ElevatedButton(
                  onPressed: () {
                    goToView(context, const GroupCheckboxExampleView());
                  },
                  child: const Text("Group Checkbox Example View")),
              ElevatedButton(
                  onPressed: () {
                    goToView(context, CircleAvatarImageAndAlphabetExampleView(viewModel: CircleAvatarImageAndAlphabetExampleViewModel()));
                  },
                  child: const Text(
                    "Circle Avatar Image And Alphabet Example",
                    textAlign: TextAlign.center,
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}
