import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  CustomDropdown({Key? key, this.selectedItems, required this.tittleText, required this.onChanged}) : super(key: key);
  List<String> items = ['Items 1', 'Items 2', 'Items 3', 'Items 4', 'Items 5', 'Items 6'];
  //Liste içerindeki veriler model dosyamızdan ya da dinamik olarak verebiliriz.
  //We can give the data in the list from our model file or dynamically.
  final String? selectedItems;
  final String tittleText;
  final void Function(String? model) onChanged;

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _selectedItems;

  @override
  void initState() {
    super.initState();
    _selectedItems = widget.selectedItems;
  }

  void _changeSelectItems(String? data) {
    // model ya da listemizden gelen datalar.
    // data from our model or list.
    setState(() {
      _selectedItems = data;
    });
    widget.onChanged(data);
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        hint: Text(widget.tittleText),
        value: _selectedItems,
        onChanged: _changeSelectItems,
        items: widget.items.map((e) {
          return _dropdownMenuItem(e);
        }).toList());
  }

  DropdownMenuItem<String> _dropdownMenuItem(String e) => DropdownMenuItem(value: e, child: Text(e.toString()));
}
