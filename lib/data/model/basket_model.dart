class BasketModel {
  num? totalPrice;
  num? totalDiscountPrice;
  num? totalFinalPrice;
  List<BasketProductItems>? items;

  BasketModel(
      {this.totalPrice,
      this.totalDiscountPrice,
      this.totalFinalPrice,
      this.items});

  BasketModel.fromJson(Map<String, dynamic> json) {
    totalPrice = json['totalPrice'];
    totalDiscountPrice = json['totalDiscountPrice'];
    totalFinalPrice = json['totalFinalPrice'];
    if (json['items'] != null) {
      items = <BasketProductItems>[];
      json['items'].forEach((v) {
        items!.add(BasketProductItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalPrice'] = totalPrice;
    data['totalDiscountPrice'] = totalDiscountPrice;
    data['totalFinalPrice'] = totalFinalPrice;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BasketProductItems {
  int? count;
  num? fee;
  num? price;
  num? discountPercent;
  num? discountPrice;
  num? finalPrice;
  String? productTitle;
  String? productImage;
  int? productId;

  BasketProductItems(
      {this.count,
      this.fee,
      this.price,
      this.discountPercent,
      this.discountPrice,
      this.finalPrice,
      this.productTitle,
      this.productImage,
      this.productId});

  BasketProductItems.fromJson(Map<String, dynamic> json) {
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
