import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class CircleAvatarImageAndAlphabetExampleViewModel extends ChangeNotifier {
  final picker = ImagePicker();
  File? image;
  int color = 0xFFFF9000;

  set changeColor(int color) {
    color = color;
    notifyListeners();
  }

  late TextEditingController controllerAdi, controllerSoyadi;
  CircleAvatarImageAndAlphabetExampleViewModel() {
    controllerAdi = TextEditingController()
      ..addListener(() {
        notifyListeners();
      });

    controllerSoyadi = TextEditingController()
      ..addListener(() {
        notifyListeners();
      });
  }

  getImage(bool issourceGallery) async {
    final pickedFile = await picker.pickImage(source: issourceGallery ? ImageSource.gallery : ImageSource.camera);

    if (pickedFile != null) {
      image = File(pickedFile.path);

      image = await _cropImage(image);
    }

    notifyListeners();
  }

  Future<File?>? _cropImage(File? image) async {
    if (image != null) {
      var croppedFile = await ImageCropper.platform.cropImage(sourcePath: image.path, aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ], uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ]);

      if (croppedFile != null) {
        return File(croppedFile.path);
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  void selectedColor(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: MaterialPicker(
                pickerColor: Colors.deepOrange,
                onColorChanged: (secilenRenk) {
                  color = secilenRenk.value;

                  image = null;

                  notifyListeners();

                  Navigator.pop(context);
                },
              ),
            ),
          );
        });
  }
}
