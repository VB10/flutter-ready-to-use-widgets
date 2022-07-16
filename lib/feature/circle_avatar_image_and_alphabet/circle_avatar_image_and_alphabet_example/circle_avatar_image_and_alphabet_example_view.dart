import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ready_to_use_widgets/feature/circle_avatar_image_and_alphabet/circle_avatar_image_and_alphabet.dart';
import 'package:kartal/kartal.dart';
import '../../../atomic/text_field/custom_text_field.dart';
import 'circle_avatar_image_and_alphabet_example_view_model.dart';

class CircleAvatarImageAndAlphabetExampleView extends StatelessWidget {
  const CircleAvatarImageAndAlphabetExampleView({Key? key, required this.viewModel}) : super(key: key);

  final CircleAvatarImageAndAlphabetExampleViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Circle Avatar Image And Alphabet"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: context.paddingMedium,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              viewModel.getImage(false);
                            },
                            icon: const Icon(Icons.add_a_photo_outlined)),
                        Consumer<CircleAvatarImageAndAlphabetExampleViewModel>(
                          builder: (context, value, child) {
                            return CircleAvatarImageAndAlphabet(
                              color: viewModel.color,
                              imagePath: viewModel.image == null ? null : viewModel.image!.path,
                              radius: context.width * 0.2,
                              text: viewModel.controllerAdi.text + " " + viewModel.controllerSoyadi.text,
                              onTap: () {
                                viewModel.selectedColor(context);
                              },
                            );
                          },
                        ),
                        IconButton(
                            onPressed: () {
                              viewModel.getImage(true);
                            },
                            icon: const Icon(Icons.file_upload))
                      ],
                    ),
                    Padding(
                        padding: context.verticalPaddingLow,
                        child: CustomTextField(
                          controller: viewModel.controllerAdi,
                          labelText: "Adı",
                        )),
                    Padding(
                        padding: context.verticalPaddingLow,
                        child: CustomTextField(
                          controller: viewModel.controllerSoyadi,
                          labelText: "Soyadi",
                        )),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
