import 'package:dio/dio.dart';
import 'package:online_shop/main.dart';
import 'package:online_shop/screens/auth/auth_scren.dart';
import 'package:online_shop/utils/navigator.dart';
import 'package:online_shop/utils/snack_bar.dart';

final Dio httpClient = Dio(
  BaseOptions(
    baseUrl: 'https://flutter.vesam24.com/api/',
  ),
)..interceptors.add(
    InterceptorsWrapper(
      onError: (e, handler) async {
        if (e.response?.data['errors'] != null) {
          var errors = e.response?.data['errors'] as Map<String, dynamic>;
          if (errors.isNotEmpty) {
            showCustomAlert(
              navigatorKey.currentContext!,
              errors.values.first[0].toString(),
              AlertType.error,
            );
          }
        } else if (e.response != null) {
          switch (e.response!.statusCode) {
            case 400:
              showCustomAlert(
                navigatorKey.currentContext!,
                'خطا در درخواست: درخواست نامعتبر است.',
                AlertType.error,
              );
              break;
            case 401:
              await prefs.remove('token');
              isLogin.value = false;
              goScreen(
                context: navigatorKey.currentContext!,
                screen: const AuthScreen(),
                fullScreen: true,
                closeScreen: true,
              );
              showCustomAlert(
                navigatorKey.currentContext!,
                'خطا در احراز هویت: دسترسی غیرمجاز.',
                AlertType.error,
              );
              break;
            case 403:
              showCustomAlert(
                navigatorKey.currentContext!,
                'خطا در دسترسی: عدم دسترسی به منبع مورد نظر.',
                AlertType.error,
              );
              break;
            case 404:
              showCustomAlert(
                navigatorKey.currentContext!,
                'خطا در یافت نشدن: منبع درخواست شده یافت نشد.',
                AlertType.error,
              );
              break;
            case 500:
              showCustomAlert(
                navigatorKey.currentContext!,
                'خطای سرور: خطای داخلی سرور.',
                AlertType.error,
              );
              break;
            default:
              showCustomAlert(
                navigatorKey.currentContext!,
                'خطای ناشناخته.',
                AlertType.error,
              );
              break;
          }
        } else {
          showCustomAlert(
            navigatorKey.currentContext!,
            'خطا نامشخص.',
            AlertType.error,
          );
        }

        throw Exception();
      },
      onRequest: (options, handler) {
        String? userToken = prefs.getString('token');
        if (userToken != null) {
          options.headers['Authorization'] = 'Bearer $userToken';
        }
        handler.next(options);
      },
    ),
  );
