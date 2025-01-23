import 'package:dio/dio.dart';
import 'package:online_shop/data/model/auth_model.dart';
import 'package:online_shop/utils/http_clinet.dart';

class AuthService {
  Future<void> register(AuthModel authModel) async {
    await httpClient.post(
      'accounts/signup',
      data: authModel.toJson(),
    );
  }

  Future<AuthModel> login(AuthModel authModel) async {
    Response response =
        await httpClient.post('accounts/login', data: authModel.toJson());
    return AuthModel.fromJson(response.data);
  }
}
