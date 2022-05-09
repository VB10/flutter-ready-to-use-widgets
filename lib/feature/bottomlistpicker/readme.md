
# Bottom List Picker

Bu widget ile verdiğiniz `Future` modelin belirlediniz **property** degeri ile seçim yaptırabilirsiniz.

``` dart 
 INetworkManager networkManager =
      NetworkManager(isEnableLogger: true, options: BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));
      ...
TextField(
          readOnly: true,
          onTap: () {
            BottomListPicker.show(
                context: context,
                textController: _userController,
                fecthData:
                    networkManager.send<User, List<User("users", parseModel: User(), methodRequestType.GET),
                showedField: "name",
                onChanged: (item) {
                  log(item["name"]);
                  User selectedUser = User.fromJson(item);
                  log(selectedUser.phone ?? "selected usephone");
                });
          },
          controller: _userController,
          decoration: const InputDecoration(
            suffixIcon: Icon(Icons.arrow_drop_down),
            labelText: "Select User",
                    border: OutlineInputBorder(),
                  ),
        ),

```

Network manager olarak [Vexana](https://pub.dev/packages/vexana) paketi kullanılmıştır. Siz kendi paketinize ve modelinize göre ayarlayabilirsiniz. 
> Dikkat edilmesi gereken kullandıgınız modelin `fromJson` ve `toJson` metotlarının olması gerektiğidir.

`TextField` ile kullanmanıza gerek yoktur. Herhangi bir **button** ile de acabilirsiniz.

```dart
void showPicker() {
    BottomListPicker.show(
        context: context,
        fecthData:
            networkManager.send<User, List<User("users"parseModel: User(), methodRequestType.GET),
        showedField: "name",
        onChanged: (item) {
          log(item["name"]);
          User selectedUser = User.fromJson(item);
          log(selectedUser.phone ?? "selected usephone");
          setState((){
              // .....
          })
        });
     }
```
> `showedField` parametresi kullanıcıya göstermek istediginiz alandır.

> `fecthData` parametresi datanızın dönecegi API istegidir.

> `onChanged` parametresi secili değer değişince tetiklenir ve size seçilen degeri `Map` şeklinde dönderir. `User selectedUser = User.fromJson(item);`  şeklinde geri parse edebilirsiniz ya da `item["name"]` şeklinde kullanmak istediğiniz degeri alabilirsiniz.

> `textController` parametresi `TextEditingController` türündedir. şeçilen değeri controllerun textine set eder. zorunlu değildir. **TextField** ile birlikte kullandıgınız zaman kullanabilirsiniz.


