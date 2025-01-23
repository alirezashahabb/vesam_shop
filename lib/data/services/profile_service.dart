import 'package:dio/dio.dart';
import 'package:online_shop/data/model/user_comment_model.dart';
import 'package:online_shop/data/model/user_peyment_model.dart';
import 'package:online_shop/utils/http_clinet.dart';

// get user Comment
class ProfileService {
  Future<List<UserCommentModel>> getComment() async {
    Response response = await httpClient.get('users/me/comments');

    List<UserCommentModel> userComments = [];

    for (var comment in response.data) {
      userComments.add(UserCommentModel.fromJson(comment));
    }
    return userComments;
  }

// get user Payment
  Future<List<UserPaymentModel>> getUserPayment() async {
    Response response = await httpClient.get('users/me/succeeded-orders');

    List<UserPaymentModel> userPayment = [];

    for (var comment in response.data) {
      userPayment.add(UserPaymentModel.fromJson(comment));
    }
    return userPayment;
  }
}
