import 'package:vexana/vexana.dart';

class User extends INetworkModel {
  int? id;
  String? name;
  String? username;
  String? email;

  String? phone;
  String? website;

  User({this.id, this.name, this.username, this.email, this.phone, this.website});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];

    phone = json['phone'];
    website = json['website'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;

    data['phone'] = this.phone;
    data['website'] = this.website;

    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return User.fromJson(json);
  }
}
