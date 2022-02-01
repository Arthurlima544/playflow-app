import 'dart:convert';

class UserModel {
  String? name;
  String? photoUrl;

  UserModel({this.name, this.photoUrl});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(name: map['name'], photoUrl: map['photoUrl']);
  }

  factory UserModel.fromJson(String json) =>
      UserModel.fromMap(jsonDecode(json));

  Map<String, dynamic> toMap() => {
        "name": name,
        "photoUrl": photoUrl,
      };

  String toJson() => jsonEncode(toMap());
}
