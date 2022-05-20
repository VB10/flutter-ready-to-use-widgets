import 'package:flutter/material.dart';

import '../model/abstract_checkbox_item.dart';

import 'package:collection/collection.dart';

class GroupCheckBoxBuilder<T extends ICheckBoxItem> extends StatefulWidget {
  const GroupCheckBoxBuilder({
    Key? key,
    required this.itemList,
    required this.isMultiSelectEnable,
    this.initialSelectedItem,
    this.lastSelectedItem,
    this.allSelectedItemList,
    this.direction = Axis.horizontal,
    this.checkboxDirection = Axis.horizontal,
    this.activeColor,
    this.checkColor,
    this.checkBoxshape,
    this.cardShape,
    this.verticalDirection = VerticalDirection.down,
  }) : super(key: key);

  final List<T>? itemList;
  final bool isMultiSelectEnable;
  final T? initialSelectedItem;
  final void Function(T lastSelectedItem)? lastSelectedItem;
  final void Function(List<T>? allItems)? allSelectedItemList;

  final Axis direction;
  final Axis checkboxDirection;
  final Color? activeColor;
  final Color? checkColor;
  final OutlinedBorder? checkBoxshape;
  final ShapeBorder? cardShape;
  final VerticalDirection verticalDirection;

  @override
  State<GroupCheckBoxBuilder> createState() => _GroupCheckBoxBuilderState();
}

class _GroupCheckBoxBuilderState<T extends ICheckBoxItem> extends State<GroupCheckBoxBuilder<T>> {
  late List<T>? _allSelectedItemList;

  @override
  void initState() {
    super.initState();
    _allSelectedItemList = [];
    _setInitialSelectedItem();
  }

  void _setInitialSelectedItem() {
    if (widget.initialSelectedItem != null) {
      _updateInitialSelectedItem();
    }
  }

  @override
  void didUpdateWidget(covariant GroupCheckBoxBuilder<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialSelectedItem != widget.initialSelectedItem) {
      setState(() {
        _updateInitialSelectedItem();
      });
    }
  }

  void _updateInitialSelectedItem() {
    widget.itemList?.firstWhereOrNull((element) => element.id == widget.initialSelectedItem?.id)?.isSelected = true;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
        direction: widget.direction,
        children: widget.itemList?.map<Widget>((item) {
              return InkWell(
                onTap: () => _onItemClicked(item, !item.isSelected),
                child: Card(
                  margin: const EdgeInsets.all(12),
                  shape: widget.cardShape ?? RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Wrap(
                      direction: widget.checkboxDirection,
                      verticalDirection: widget.verticalDirection,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(item.name),
                        ),
                        const SizedBox(width: 20),
                        Checkbox(
                          value: item.isSelected,
                          onChanged: (value) => _onItemClicked(item, value!),
                          activeColor: widget.activeColor,
                          checkColor: widget.checkColor,
                          shape: widget.checkBoxshape,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList() ??
            []);
  }

  void _onItemClicked(T model, bool newValue) {
    setState(() => model.isSelected = newValue);
    widget.lastSelectedItem?.call(model);
    if (!widget.isMultiSelectEnable) {
      widget.allSelectedItemList?.call([]);
      _addSingleItemToList(model);
    }
    if (widget.isMultiSelectEnable) {
      if (_allSelectedItemList?.contains(model) ?? false) {
        _removeItemFromAllSelectedItemList(model);
      } else {
        _addNewItemToAllSelectedItemList(model);
      }
      setState(() {});
    }
    widget.allSelectedItemList?.call(_allSelectedItemList);
  }

  void _addSingleItemToList(T model) {
    widget.itemList?.map((element) => element.id != model.id ? element.isSelected = false : null).toList();
    _allSelectedItemList?.clear();
    _allSelectedItemList?.add(model);
  }

  void _addNewItemToAllSelectedItemList(T item) {
    _allSelectedItemList?.add(item);
  }

  void _removeItemFromAllSelectedItemList(T item) {
    _allSelectedItemList?.remove(item);
  }
}
