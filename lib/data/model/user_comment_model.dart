class UserCommentModel {
  String? productTitle;
  String? productImage;
  int? id;
  String? subject;
  String? text;
  String? userFullName;
  String? userEmail;
  int? productId;
  String? createDate;

  UserCommentModel(
      {this.productTitle,
      this.productImage,
      this.id,
      this.subject,
      this.text,
      this.userFullName,
      this.userEmail,
      this.productId,
      this.createDate});

  UserCommentModel.fromJson(Map<String, dynamic> json) {
    productTitle = json['productTitle'];
    productImage = json['productImage'];
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
    data['productTitle'] = productTitle;
    data['productImage'] = productImage;
    data['id'] = id;
    data['subject'] = subject;
    data['text'] = text;
    data['userFullName'] = userFullName;
    data['userEmail'] = userEmail;
    data['productId'] = productId;
    data['createDate'] = createDate;
    return data;
  }
}
