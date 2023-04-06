import 'package:flutter/material.dart';
import 'package:ready_to_use_widgets/feature/custom_drawer/view/drawer/viewmodel/drawer_view_model.dart';

class DrawerView extends StatelessWidget {
  DrawerView({Key? key, required this.width}) : super(key: key);
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
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Wrap(
                      direction: Axis.vertical,
                      alignment: WrapAlignment.spaceEvenly,
                      spacing: 20,
                      children: [
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
