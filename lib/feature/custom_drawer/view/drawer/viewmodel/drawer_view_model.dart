import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:ready_to_use_widgets/core/init/constants/drawer_item_constant.dart';
import 'package:ready_to_use_widgets/feature/custom_drawer/view/drawer/model/drawer_item_model.dart';
part 'drawer_view_model.g.dart';

class DrawerViewModel = _DrawerViewModelBase with _$DrawerViewModel;

abstract class _DrawerViewModelBase with Store {
  final List items = [
    DrawerItemModel(
            onTap: () {},
            title: DrawerItemConstants.PROFIL.keys.first,
            icon: DrawerItemConstants.PROFIL.values.first)
        .convertToListTile,
    DrawerItemModel(
            onTap: () {},
            title: DrawerItemConstants.LISTS.keys.first,
            icon: DrawerItemConstants.LISTS.values.first)
        .convertToListTile,
    DrawerItemModel(
            onTap: () {},
            title: DrawerItemConstants.CIRCLE.keys.first,
            icon: DrawerItemConstants.CIRCLE.values.first)
        .convertToListTile,
    DrawerItemModel(
            onTap: () {},
            title: DrawerItemConstants.BOOKMARKS.keys.first,
            icon: DrawerItemConstants.BOOKMARKS.values.first)
        .convertToListTile,
    DrawerItemModel(
            onTap: () {},
            title: DrawerItemConstants.MOMENTS.keys.first,
            icon: DrawerItemConstants.MOMENTS.values.first)
        .convertToListTile,
    DrawerItemModel(
            onTap: () {},
            title: DrawerItemConstants.TOPICS.keys.first,
            icon: DrawerItemConstants.TOPICS.values.first)
        .convertToListTile,
  ];

  void navigateToPage({required BuildContext context, required String route}) {
    Navigator.of(context).pushNamed(route);
  }
}
