import 'package:flutter/material.dart';

class DrawerItemModel {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  DrawerItemModel({
    required this.title,
    required this.icon,
    required this.onTap,
  });
}

extension DrawerItemConvertExtension on DrawerItemModel {
  Widget get convertToListTile => ListTile(
        title: Text(title),
        leading: Icon(icon),
        onTap: onTap,
      );
}
