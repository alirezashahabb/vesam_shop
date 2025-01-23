class AuthModel {
  String? fullName;
  String? phoneNumber;
  String? email;
  String? password;
  String? accessToken;

  AuthModel({this.fullName, this.phoneNumber, this.email, this.password});

  AuthModel.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    password = json['password'];
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullName'] = fullName;
    data['phoneNumber'] = phoneNumber;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
