class ProductDetailModel {
  String? description;
  String? keyword;
  String? advantages;
  String? disAdvanteges;
  int? visitedStatistics;
  List<String>? images;
  List<Comments>? comments;
  int? id;
  String? title;
  num? price;
  num? discountPrice;
  bool? hasDiscount;
  num? discountPercent;
  String? image;

  ProductDetailModel(
      {this.description,
      this.keyword,
      this.advantages,
      this.disAdvanteges,
      this.visitedStatistics,
      this.images,
      this.comments,
      this.id,
      this.title,
      this.price,
      this.discountPrice,
      this.hasDiscount,
      this.discountPercent,
      this.image});

  ProductDetailModel.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    keyword = json['keyword'];
    advantages = json['advantages'];
    disAdvanteges = json['disAdvanteges'];
    visitedStatistics = json['visitedStatistics'];
    images = json['images'].cast<String>();
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(Comments.fromJson(v));
      });
    }
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
    data['description'] = description;
    data['keyword'] = keyword;
    data['advantages'] = advantages;
    data['disAdvanteges'] = disAdvanteges;
    data['visitedStatistics'] = visitedStatistics;
    data['images'] = images;
    if (comments != null) {
      data['comments'] = comments!.map((v) => v.toJson()).toList();
    }
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

class Comments {
  int? id;
  String? subject;
  String? text;
  String? userFullName;
  String? userEmail;
  int? productId;
  String? createDate;

  Comments(
      {this.id,
      this.subject,
      this.text,
      this.userFullName,
      this.userEmail,
      this.productId,
      this.createDate});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subject = json['subject'];
    text = json['text'];
    userFullName = json['userFullName'];
    userEmail = json['userEmail'];
    productId = json['productId'];
    createDate = json['createDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subject'] = subject;
    data['text'] = text;
    data['productId'] = productId;
    return data;
  }
}
