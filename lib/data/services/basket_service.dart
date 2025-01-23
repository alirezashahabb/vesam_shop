import 'package:dio/dio.dart';
import 'package:online_shop/data/model/basket_model.dart';
import 'package:online_shop/data/model/payment_model.dart';
import 'package:online_shop/utils/http_clinet.dart';

class BasketService {
  Future<BasketModel> getAllBasket() async {
    Response response = await httpClient.get('shopcarts');

    return BasketModel.fromJson(response.data);
  }

  Future<void> addBasket(int productId) async {
    await httpClient.post('shopcarts/add-product/$productId');
  }

  Future<void> increaseCount(int productId) async {
    await httpClient.patch('shopcarts/$productId/increase-count');
  }

  Future<void> decreesCount(int productId) async {
    await httpClient.patch('shopcarts/$productId/decrease-count');
  }

  Future<void> removeProductsFromBasket(int productId) async {
    await httpClient.post('shopcarts/remove-product/$productId');
  }

  Future<String> payment(PaymentModel payment) async {
    Response response = await httpClient
        .post('https://flutter.vesam24.com/payment', data: payment.toJson());

    return response.data;
  }
}
