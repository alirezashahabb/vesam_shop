class UserModel {
  String? fullName;
  String? email;
  String? phoneNumber;
  String? registrationDate;

  UserModel(
      {this.fullName, this.email, this.phoneNumber, this.registrationDate});

  UserModel.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    registrationDate = json['registrationDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullName'] = fullName;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['registrationDate'] = registrationDate;
    return data;
  }
}
