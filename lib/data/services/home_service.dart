import 'package:dio/dio.dart';
import 'package:online_shop/data/model/home_model.dart';
import 'package:online_shop/data/model/uder_model.dart';
import 'package:online_shop/utils/http_clinet.dart';

class HomeService {
  Future<HomeModel> getGeneralInfo() async {
    Response response = await httpClient.get('home');
    return HomeModel.fromJson(response.data);
  }

  Future<UserModel> getUserInfo() async {
    Response response = await httpClient.get('users/me');
    return UserModel.fromJson(response.data);
  }
}
