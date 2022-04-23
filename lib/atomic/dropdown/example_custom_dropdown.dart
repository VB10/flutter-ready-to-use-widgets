import 'package:flutter/material.dart';

import 'custom_dropdownd.dart';

class ExampleCustomDropdown extends StatelessWidget {
  const ExampleCustomDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Dropdown'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: CustomDropdown(
                tittleText: 'Lütfen Eleman Seçiniz',
                onChanged: (data) {},
              ),
              //Basit bir dropdown widget yapsını atomic olarak oluşturarak sayfamızda temiz kullanım ile yer veriyoruz.
              //We create a simple dropdown widget structure atomically and place it on our page with clean usage.
            )
          ],
        ),
      ),
    );
  }
}
