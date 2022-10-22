import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_specific_drawer/view/root/viewmodel/root_view_model.dart';

import '../../drawer/view/drawer_view.dart';
import '../../home/view/home_view.dart';

class RootView extends StatefulWidget {
  const RootView({super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  final _viewModel = RootViewModel();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        _buildPage(),
        _buildDrawer(),
      ],
    );
  }

  Widget _buildPage() => Observer(
        builder: (_) => GestureDetector(
          onTap: () => _viewModel.onTap(),
          onHorizontalDragUpdate: (details) => _viewModel.onHorizontalDragUpdate(details),
          onHorizontalDragEnd: (details) => _viewModel.onHorizontalDragEnd(details),
          child: AnimatedContainer(
            duration: _viewModel.drawerDuration,
            transform: Matrix4.translationValues(_viewModel.xOffset, 0, 0),
            child: AbsorbPointer(
              absorbing: _viewModel.isOpenDrawer,
              child: HomeView(
                openDrawer: _viewModel.openDrawer,
                isDrawerOpen: _viewModel.isOpenDrawer,
              ),
            ),
          ),
        ),
      );

  Widget _buildDrawer() => Observer(
        builder: (_) => GestureDetector(
          onHorizontalDragUpdate: (details) => _viewModel.onHorizontalDragUpdate(details),
          onHorizontalDragEnd: (details) => _viewModel.onHorizontalDragEnd(details),
          child: AnimatedContainer(
            duration: _viewModel.drawerDuration,
            transform: Matrix4.translationValues(_viewModel.xOffset - _viewModel.drawerMaxWidth, 0, 0),
            child: DrawerView(width: _viewModel.drawerMaxWidth),
          ),
        ),
      );
}
