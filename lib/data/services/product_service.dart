import 'package:dio/dio.dart';
import 'package:online_shop/data/model/product_detail_model.dart';
import 'package:online_shop/data/model/product_model.dart';
import 'package:online_shop/utils/http_clinet.dart';

class ProductService {
  Future<ProductModel> getLatestProduct() async {
    Response response = await httpClient.get('products?order=latest');
    return ProductModel.fromJson(response.data);
  }

  Future<ProductModel> getPopularProduct() async {
    Response response = await httpClient.get('products?order=popular');
    return ProductModel.fromJson(response.data);
  }

  Future<ProductDetailModel> getProductDetail(int id) async {
    Response response = await httpClient.get('products/$id');
    return ProductDetailModel.fromJson(response.data);
  }

  Future<void> sendProductComment(Comments comment) async {
    await httpClient.post(
      'comments',
      data: comment.toJson(),
    );
  }
}
