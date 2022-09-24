import 'package:flutter/material.dart';
import 'package:ready_to_use_widgets/core/init/constants/color_constant.dart';

import '../constants/constants.dart';
import '../constants/page_border_radius.dart';
import '../constants/page_padding.dart';
import '../model/items.dart';
import '../widgets/drag_box.dart';
import '../widgets/toolbar_item.dart';

class DynamicCoolToolBar extends StatefulWidget {
  const DynamicCoolToolBar({Key? key}) : super(key: key);

  @override
  _DynamicCoolToolBarState createState() => _DynamicCoolToolBarState();
}

class _DynamicCoolToolBarState extends State<DynamicCoolToolBar> {
  /// Scroll controller to be hooked with the items list
  late ScrollController scrollController;

  bool isOnPressedCloseButton = false;
  bool isOnLongPressed = false;

  double get itemHeight =>
      Constants.toolbarWidth - (Constants.toolbarHorizontalPadding * 2);

  /// List of item scales
  ///
  /// item at index [x] has scale of [itemScrollScaleValues[x]]
  List<double> itemScrollScaleValues = [];

  /// List of item y positions
  ///
  /// item at index [x] has y position of [itemYPositions[x]]
  /// The position is of the top edge of each item and is local to the toolbar container
  List<double> itemYPositions = [];

  /// List of bool values indicating long press
  ///
  /// item at index [x] is long pressed id [itemYPositions[x]] is true
  List<bool> longPressedItemsFlags = [];

  void scrollListener() {
    if (scrollController.hasClients) {
      _updateItemsScrollData(
        scrollPosition: scrollController.position.pixels,
      );
    }
  }

  /// Updates scale values and item positions
  /// based on the current scroll position
  ///
  /// Called inside scrollListener to update [itemScrollScaleValues] & [itemYPositions]
  void _updateItemsScrollData({double scrollPosition = kZero}) {
    List<double> _itemScrollScaleValues = [];
    List<double> _itemYPositions = [];
    for (int i = 0; i <= toolbarItems.length - 1; i++) {
      double itemTopPosition = i * (itemHeight + Constants.itemsGutter);
      // Storing y position values of the items with the scrollPosition value subtracted
      // gives the location of the item relative to the toolbar container
      // For example, at first, item 1 is at the top with a position of 0,
      // but when scrolled a distance of 20, item 2's position is now it's previous position
      // (let's say 20) minus the scrolled distance, making it at the correct position when
      // a long press event is received at this location
      _itemYPositions.add(itemTopPosition - scrollPosition);

      // Difference between the position of the top edge of the item
      // and the position of the bottom edge of the toolbar container plus scroll position
      // A negative value means that the item is out of view below the toolbar container
      double distanceToMaxScrollExtent =
          Constants.toolbarHeight + scrollPosition - itemTopPosition;

      // Position of the bottom edge of the item
      double itemBottomPosition =
          (i + 1) * (itemHeight + Constants.itemsGutter);
      // An item is out of view if it's out of view below the toolbar
      // OR if it's out of view above the toolbar (where the scroll position is further than
      // the position of the bottom edge of the item
      bool itemIsOutOfView =
          distanceToMaxScrollExtent < 0 || scrollPosition > itemBottomPosition;

      // If the item is out of view, scale it down, if it's visible, reset it to default scale
      _itemScrollScaleValues.add(itemIsOutOfView ? 0.4 : 1);
    }
    setState(() {
      itemScrollScaleValues = _itemScrollScaleValues;
      itemYPositions = _itemYPositions;
    });
  }

  /// Updates [longPressedItemsFlags] based on the location of the long press event
  ///
  /// Should be called whenever a long-press related event happens
  /// e.g. Long press started, ended, cancelled, moved while pressed, ...etc.
  void _updateLongPressedItemsFlags({double longPressYLocation = 0}) {
    List<bool> _longPressedItemsFlags = [];

    for (int i = 0; i <= toolbarItems.length - 1; i++) {
      // An item is long pressed if the long press y location is larger than the current
      // item's top edge position and smaller than the next items top edge position
      // If there is no next item, the long press y location should be smaller
      // than the scrollable area (the height of the toolbar_
      bool isLongPressed = itemYPositions[i] >= 0 &&
          longPressYLocation > itemYPositions[i] &&
          longPressYLocation <
              (itemYPositions.length > i + 1
                  ? itemYPositions[i + 1]
                  : Constants.toolbarHeight);
      _longPressedItemsFlags.add(isLongPressed);
    }
    setState(() {
      longPressedItemsFlags = _longPressedItemsFlags;
    });
  }

  @override
  void initState() {
    super.initState();
    _updateItemsScrollData();
    _updateLongPressedItemsFlags();
    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
  }

  @override
  void dispose() {
    scrollController.removeListener(scrollListener);
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const PagePadding.allNormalPadding(),
          child: Stack(
            children: [
              DragBox(
                  initPosition: Constants.offset, child: _animatedContainer()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _animatedContainer() {
    return AnimatedContainer(
      width: isOnLongPressed
          ? Constants.toolbarLongPressedWidth
          : Constants.toolbarWidth,
      duration: Constants.longPressAnimationDuration,
      height: isOnPressedCloseButton
          ? Constants.onPressedCloseButton
          : Constants.toolbarHeight,
      child: Stack(
        children: [
          _toolbarBackgroundContainer(),
          _toolBarItemsGestureDetector(),
          AnimatedAlign(
            duration: Constants.longPressAnimationDuration,
            alignment: isOnPressedCloseButton
                ? Alignment.topLeft
                : Alignment.bottomLeft,
            child: _closeIconButton(),
          )
        ],
      ),
    );
  }

  Widget _toolbarBackgroundContainer() {
    return Container(
      width: Constants.toolbarWidth,
      decoration: BoxDecoration(
        color: ColorConstants.white,
        borderRadius: PageBorderRadius.allNormalCircular(),
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: ColorConstants.black.withOpacity(0.2),
          ),
        ],
      ),
    );
  }

  GestureDetector _toolBarItemsGestureDetector() {
    return GestureDetector(
      onLongPressStart: (LongPressStartDetails details) {
        isOnLongPressed = true;
        _updateLongPressedItemsFlags(
          longPressYLocation: details.localPosition.dy,
        );
      },
      onLongPressMoveUpdate: (details) {
        _updateLongPressedItemsFlags(
          longPressYLocation: details.localPosition.dy,
        );
      },
      onLongPressEnd: (LongPressEndDetails details) {
        isOnLongPressed = false;
        _updateLongPressedItemsFlags(longPressYLocation: kZero);
      },
      onLongPressCancel: () {
        _updateLongPressedItemsFlags(longPressYLocation: kZero);
      },
      child: AnimatedContainer(
        duration: Constants.scrollScaleAnimationDuration,
        height: isOnPressedCloseButton ? kZero : Constants.toolbarHeight,
        child: Stack(
          children: [
            _toolBarItems(),
          ],
        ),
      ),
    );
  }

  ListView _toolBarItems() {
    return ListView.builder(
      controller: scrollController,
      padding: const PagePadding.allMediumPadding(),
      itemCount: toolbarItems.length,
      itemBuilder: (c, i) => ToolbarItem(
        toolbarItems[i],
        height: itemHeight,
        scrollScale: itemScrollScaleValues[i],
        isLongPressed: longPressedItemsFlags[i],
      ),
    );
  }

  GestureDetector _closeIconButton() {
    return GestureDetector(
      onTap: () {
        isOnPressedCloseButton = !isOnPressedCloseButton;
        setState(() {});
      },
      child: Icon(isOnPressedCloseButton
          ? Icons.keyboard_arrow_down_rounded
          : Icons.keyboard_arrow_up_rounded),
    );
  }
}
