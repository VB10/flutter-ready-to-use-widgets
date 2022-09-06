import 'package:flutter/material.dart';
import 'package:ready_to_use_widgets/core/init/constants/color_constant.dart';

import '../model/abstract_checkbox_item.dart';
import '../model/city_model.dart';
import '../widget/group_checkbox_builder.dart';

class GroupCheckboxExampleView extends StatefulWidget {
  const GroupCheckboxExampleView({
    Key? key,
  }) : super(key: key);

  @override
  State<GroupCheckboxExampleView> createState() =>
      _GroupCheckboxExampleViewState();
}

class _GroupCheckboxExampleViewState extends State<GroupCheckboxExampleView> {
  late List<ICheckBoxItem> _cityList;
  bool _isMultiSelectEnable = false;
  late List<ICheckBoxItem>? _allSelectedItemList;
  ICheckBoxItem? initialItem;
  ICheckBoxItem? lastSelectedItem;

  TextStyle contentTextStyle =
      const TextStyle(fontSize: 24, color: ColorConstants.pomegranate);
  TextStyle titleTextStyle =
      const TextStyle(fontSize: 32, color: ColorConstants.black);

  @override
  void initState() {
    super.initState();
    _cityList = City.cityList;
    _allSelectedItemList = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Group Checkbox Example View'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GroupCheckBoxBuilder<ICheckBoxItem>(
              itemList: _cityList,
              isMultiSelectEnable: _isMultiSelectEnable,
              initialSelectedItem: initialItem,
              lastSelectedItem: (ICheckBoxItem? item) {
                debugPrint('Last selected item : ${item?.name}');
                setState(() {
                  lastSelectedItem = item;
                });
              },
              allSelectedItemList: (List<ICheckBoxItem>? allSelectedItems) {
                debugPrint(
                    'All selected items lenght : ${allSelectedItems?.length}');
                debugPrint(
                    'All selected items : ${allSelectedItems?.toString()}');
                _allSelectedItemList = allSelectedItems;
                setState(() {});
              },
            ),
            const SizedBox(height: 20),
            Text(
              'Last Selected Item',
              style: titleTextStyle,
            ),
            const SizedBox(height: 20),
            Text(
              lastSelectedItem?.name ?? '',
              style: contentTextStyle,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  lastSelectedItem = null;
                  _cityList.map((e) => e.isSelected = false).toList();
                  _allSelectedItemList?.clear();
                  _isMultiSelectEnable = !_isMultiSelectEnable;
                });
              },
              child: Text(_isMultiSelectEnable
                  ? 'Multi Select Enabled'
                  : 'Multi Select Disabled'),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    _isMultiSelectEnable ? Colors.green : Colors.red,
                  ),
                  fixedSize: MaterialStateProperty.all(const Size(200, 50))),
            ),
            const SizedBox(height: 20),
            Text(
              'Selected Item List',
              style: titleTextStyle,
            ),
            const SizedBox(height: 20),
            ..._allSelectedItemList
                    ?.map<Widget>((e) => Text(
                          e.name,
                          style: contentTextStyle,
                        ))
                    .toList() ??
                [],
            const SizedBox(height: 20),
            Text('Set Initial Selected Item', style: titleTextStyle),
            const SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _cityList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  hoverColor: ColorConstants.black,
                  onTap: () {
                    setState(() {
                      _allSelectedItemList?.clear();
                      _cityList.map((e) => e.isSelected = false).toList();
                      initialItem = _cityList[index];
                      lastSelectedItem = _cityList[index];
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      _cityList[index].name,
                      style: contentTextStyle,
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
