class UserPaymentModel {
  int? factorCode;
  String? receiverFullName;
  String? receiverPhoneNumber;
  String? receiverPostalCode;
  String? receiverAddress;
  String? createDate;
  List<InvoiceDetails>? invoiceDetails;

  UserPaymentModel(
      {this.factorCode,
      this.receiverFullName,
      this.receiverPhoneNumber,
      this.receiverPostalCode,
      this.receiverAddress,
      this.createDate,
      this.invoiceDetails});

  UserPaymentModel.fromJson(Map<String, dynamic> json) {
    factorCode = json['factorCode'];
    receiverFullName = json['receiverFullName'];
    receiverPhoneNumber = json['receiverPhoneNumber'];
    receiverPostalCode = json['receiverPostalCode'];
    receiverAddress = json['receiverAddress'];
    createDate = json['createDate'];
    if (json['invoiceDetails'] != null) {
      invoiceDetails = <InvoiceDetails>[];
      json['invoiceDetails'].forEach((v) {
        invoiceDetails!.add(InvoiceDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['factorCode'] = factorCode;
    data['receiverFullName'] = receiverFullName;
    data['receiverPhoneNumber'] = receiverPhoneNumber;
    data['receiverPostalCode'] = receiverPostalCode;
    data['receiverAddress'] = receiverAddress;
    data['createDate'] = createDate;
    if (invoiceDetails != null) {
      data['invoiceDetails'] = invoiceDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class InvoiceDetails {
  int? count;
  num? fee;
  num? price;
  num? discountPercent;
  num? discountPrice;
  num? finalPrice;
  String? productTitle;
  String? productImage;
  int? productId;

  InvoiceDetails(
      {this.count,
      this.fee,
      this.price,
      this.discountPercent,
      this.discountPrice,
      this.finalPrice,
      this.productTitle,
      this.productImage,
      this.productId});

  InvoiceDetails.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    fee = json['fee'];
    price = json['price'];
    discountPercent = json['discountPercent'];
    discountPrice = json['discountPrice'];
    finalPrice = json['finalPrice'];
    productTitle = json['productTitle'];
    productImage = json['productImage'];
    productId = json['productId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['fee'] = fee;
    data['price'] = price;
    data['discountPercent'] = discountPercent;
    data['discountPrice'] = discountPrice;
    data['finalPrice'] = finalPrice;
    data['productTitle'] = productTitle;
    data['productImage'] = productImage;
    data['productId'] = productId;
    return data;
  }
}
