import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ready_to_use_widgets/atomic/button/custom_elevated_button.dart';
import 'package:ready_to_use_widgets/atomic/divider/custom_text_divider.dart';
import 'package:ready_to_use_widgets/atomic/scrollbar/custom_scrollbar.dart';
import 'package:ready_to_use_widgets/atomic/snackbar/custom_snackbar.dart';
import 'package:ready_to_use_widgets/atomic/textfield/password_text_field.dart';
import 'package:ready_to_use_widgets/feature/bottomlistpicker/bottom_list_picker.dart';
import 'package:ready_to_use_widgets/feature/bottomlistpicker/example/user.dart';
import 'package:vexana/vexana.dart';

class BottomListPickerExample extends StatefulWidget {
  const BottomListPickerExample({Key? key}) : super(key: key);

  @override
  _BottomListPickerExampleState createState() => _BottomListPickerExampleState();
}

class _BottomListPickerExampleState extends State<BottomListPickerExample> {
  INetworkManager networkManager =
      NetworkManager(isEnableLogger: true, options: BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));
  final _userController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomTextDivider(
                text: "Custom Password Field",
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomPasswordTextField(),
              ),
              const CustomTextDivider(
                text: "Select Bottom Picker",
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  readOnly: true,
                  onTap: () {
                    BottomListPicker.show(
                        context: context,
                        textController: _userController,
                        fecthData:
                            networkManager.send<User, List<User>>("users", parseModel: User(), method: RequestType.GET),
                        showedField: "name",
                        onChanged: (item) {
                          log(item["name"]);
                          log(item["name"]);
                          User selectedUser = User.fromJson(item);
                          log(selectedUser.phone ?? "selected user phone");
                        });
                  },
                  controller: _userController,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.arrow_drop_down),
                    labelText: "Select User",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              CustomElevatedButton(
                child: const Text("Show snackbar"),
                borderRadius: 15,
                onPressed: () {
                  CustomSnackBar.showSnackBar(context, "Custom Snackbar");
                },
              ),
              const CustomTextDivider(
                text: "Custom Scrollbar",
              ),
              SizedBox(
                height: 300,
                child: CustomScrollBar(
                  child: ListView.builder(
                      itemCount: 100,
                      itemBuilder: (c, index) => Card(
                            child: Text("item $index"),
                          )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
