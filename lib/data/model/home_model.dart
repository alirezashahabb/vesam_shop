import 'package:hive/hive.dart';

part 'home_model.g.dart';

class HomeModel {
  List<HomeProducts>? news;
  List<Slides>? slides;
  List<HomeProducts>? mostVisited;

  HomeModel({this.news, this.slides, this.mostVisited});

  HomeModel.fromJson(Map<String, dynamic> json) {
    if (json['news'] != null) {
      news = <HomeProducts>[];
      json['news'].forEach((v) {
        news!.add(HomeProducts.fromJson(v));
      });
    }
    if (json['slides'] != null) {
      slides = <Slides>[];
      json['slides'].forEach((v) {
        slides!.add(Slides.fromJson(v));
      });
    }
    if (json['mostVisited'] != null) {
      mostVisited = <HomeProducts>[];
      json['mostVisited'].forEach((v) {
        mostVisited!.add(HomeProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (news != null) {
      data['news'] = news!.map((v) => v.toJson()).toList();
    }
    if (slides != null) {
      data['slides'] = slides!.map((v) => v.toJson()).toList();
    }
    if (mostVisited != null) {
      data['mostVisited'] = mostVisited!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

@HiveType(typeId: 0)
class HomeProducts extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? title;
  @HiveField(2)
  num? price;
  @HiveField(3)
  num? discountPrice;
  @HiveField(4)
  bool? hasDiscount;
  @HiveField(5)
  num? discountPercent;
  @HiveField(6)
  String? image;

  HomeProducts(
      {this.id,
      this.title,
      this.price,
      this.discountPrice,
      this.hasDiscount,
      this.discountPercent,
      this.image});

  HomeProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    discountPrice = json['discountPrice']!;
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

class Slides {
  String? title;
  String? image;
  String? url;

  Slides({this.title, this.image, this.url});

  Slides.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['image'] = image;
    data['url'] = url;
    return data;
  }
}
