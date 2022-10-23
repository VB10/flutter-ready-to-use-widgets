import 'package:flutter/material.dart';
import 'package:flutter_specific_drawer/view/drawer/viewmodel/drawer_view_model.dart';

class DrawerView extends StatelessWidget {
  DrawerView({super.key, required this.width});
  final double width;
  final viewModel = DrawerViewModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.infinity,
        width: width,
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Wrap(
                      direction: Axis.vertical,
                      alignment: WrapAlignment.spaceEvenly,
                      spacing: 20,
                      children: const [
                        CircleAvatar(child: Icon(Icons.person_outline)),
                        Text("@mysCod3r"),
                      ],
                    )
                  ],
                ),
              ),
              ...viewModel.items
            ],
          ),
        ),
      ),
    );
  }
}
