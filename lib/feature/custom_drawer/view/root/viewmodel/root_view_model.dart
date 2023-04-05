// import 'package:flutter/material.dart';
// import 'package:mobx/mobx.dart';
// part 'root_view_model.g.dart';

// class RootViewModel = _RootViewModelBase with _$RootViewModel;

// abstract class _RootViewModelBase with Store {
//   final double drawerMaxWidth = 300;
//   final Duration drawerDuration = const Duration(milliseconds: 100);

//   @observable
//   double xOffset = 0;

//   @observable
//   bool isOpenDrawer = false;

//   @action
//   void onHorizontalDragUpdate(DragUpdateDetails details) {
//     if (xOffset > drawerMaxWidth || xOffset < 0) return;
//     if (details.delta.dx > 0.5) {
//       xOffset = xOffset + 1;
//       isOpenDrawer = true;
//     } else if (details.delta.dx < 0.5) {
//       xOffset = xOffset - 1;
//       isOpenDrawer = false;
//     }
//   }

//   @action
//   void onHorizontalDragEnd(DragEndDetails details) {
//     isOpenDrawer ? xOffset = drawerMaxWidth : xOffset = 0;
//   }

//   @action
//   void onTap() {
//     isOpenDrawer = false;
//     xOffset = 0;
//   }

//   @action
//   void openDrawer() {
//     isOpenDrawer = true;
//     xOffset = drawerMaxWidth;
//   }
// }
