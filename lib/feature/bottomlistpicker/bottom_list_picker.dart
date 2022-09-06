import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ready_to_use_widgets/core/init/constants/color_constant.dart';
import 'package:vexana/vexana.dart';

class BottomListPicker<T extends INetworkModel> extends StatefulWidget {
  final TextEditingController? textController;
  final String showedField;
  final Future<IResponseModel<List<T>?>> fecthData;
  final String? buttonText;
  final Function(Map<String, dynamic>)? onChanged;
  const BottomListPicker(
      {Key? key,
      this.textController,
      required this.fecthData,
      required this.showedField,
      this.buttonText,
      this.onChanged})
      : super(key: key);

  @override
  State<BottomListPicker> createState() => _BottomListPickerState();

  static Future<void> show<T extends INetworkModel>(
      {required BuildContext context,
      TextEditingController? textController,
      required Future<IResponseModel<List<T>?>> fecthData,
      required String showedField,
      Function(Map<String, dynamic>)? onChanged}) async {
    await showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(5),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (context) {
          return BottomListPicker(
              textController: textController,
              fecthData: fecthData,
              showedField: showedField,
              onChanged: onChanged);
        });
  }
}

class _BottomListPickerState<T extends INetworkModel>
    extends State<BottomListPicker> {
  List<Map<String, dynamic>?>? data;
  bool loading = true;
  String error = "";
  @override
  void initState() {
    super.initState();
    widget.fecthData.then((value) {
      var result = value as ResponseModel<List<T>>;

      if (result.data == null) {
        throw "Veriler alınırken bir hata oluştu";
      }
      data = [];
      for (var element in result.data!) {
        data!.add(element.toJson());
      }
    }).catchError((err) {
      setState(() {
        error = err.toString();
      });
    }).whenComplete(() {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              widget.buttonText ?? "Tamam",
              style: const TextStyle(color: ColorConstants.dodgerBlue),
            ),
          ),
          Expanded(
              child: loading
                  ? const Center(
                      child: CircularProgressIndicator.adaptive(),
                    )
                  : error.isNotEmpty
                      ? Center(
                          child: Text(
                            error,
                            style: const TextStyle(
                                color: ColorConstants.pomegranate),
                          ),
                        )
                      : CupertinoPicker(
                          onSelectedItemChanged: (index) {
                            widget.textController?.text =
                                data![index]![widget.showedField];
                            if (widget.onChanged != null) {
                              widget.onChanged!(data![index]!);
                            }
                          },
                          scrollController: FixedExtentScrollController(
                              initialItem: data?.indexWhere((element) =>
                                      element![widget.showedField] ==
                                      widget.textController?.text) ??
                                  0),
                          itemExtent: 35,
                          looping: false,
                          children: List.generate(data?.length ?? 0, (index) {
                            return Text(
                              data![index]![widget.showedField],
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline5,
                            );
                          }))),
        ],
      ),
    );
  }
}
