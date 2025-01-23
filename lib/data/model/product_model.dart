import 'package:online_shop/data/model/home_model.dart';

class ProductModel {
  List<HomeProducts>? products;
  int? page;
  int? totalCount;
  int? totalPages;
  int? pageSize;

  ProductModel(
      {this.products,
      this.page,
      this.totalCount,
      this.totalPages,
      this.pageSize});

  ProductModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <HomeProducts>[];
      json['products'].forEach((v) {
        products!.add(HomeProducts.fromJson(v));
      });
    }
    page = json['page'];
    totalCount = json['totalCount'];
    totalPages = json['totalPages'];
    pageSize = json['pageSize'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    data['page'] = page;
    data['totalCount'] = totalCount;
    data['totalPages'] = totalPages;
    data['pageSize'] = pageSize;
    return data;
  }
}

class Products {
  int? id;
  String? title;
  num? price;
  num? discountPrice;
  bool? hasDiscount;
  num? discountPercent;
  String? image;

  Products(
      {this.id,
      this.title,
      this.price,
      this.discountPrice,
      this.hasDiscount,
      this.discountPercent,
      this.image});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    discountPrice = json['discountPrice'];
    hasDiscount = json['hasDiscount'];
    discountPercent = json['discountPercent'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['discountPrice'] = discountPrice;
    data['hasDiscount'] = hasDiscount;
    data['discountPercent'] = discountPercent;
    data['image'] = image;
    return data;
  }
}
