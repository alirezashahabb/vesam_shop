class PaymentModel {
  String? receiverFullName;
  String? receiverPhoneNumber;
  String? receiverPostalCode;
  String? receiverAddress;

  PaymentModel(
      {this.receiverFullName,
      this.receiverPhoneNumber,
      this.receiverPostalCode,
      this.receiverAddress});

  PaymentModel.fromJson(Map<String, dynamic> json) {
    receiverFullName = json['receiverFullName'];
    receiverPhoneNumber = json['receiverPhoneNumber'];
    receiverPostalCode = json['receiverPostalCode'];
    receiverAddress = json['receiverAddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['receiverFullName'] = receiverFullName;
    data['receiverPhoneNumber'] = receiverPhoneNumber;
    data['receiverPostalCode'] = receiverPostalCode;
    data['receiverAddress'] = receiverAddress;
    return data;
  }
}
