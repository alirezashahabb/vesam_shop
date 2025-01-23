import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:online_shop/data/model/auth_model.dart';
import 'package:online_shop/data/services/auth_service.dart';
import 'package:online_shop/data/services/home_service.dart';
import 'package:online_shop/main.dart';
import 'package:online_shop/screens/home/bloc/home_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService;
  final HomeService homeService;

  AuthBloc(this.authService, this.homeService) : super(AuthInitial()) {
    on<AuthEvent>(
      (event, emit) async {
        // login
        if (event is AuthLoginEvent) {
          emit(
            AuthLoginLoadingState(),
          );
          try {
            var response = await authService.login(event.authModel);
            if (response.accessToken != null) {
              // await prefs.setString('token', response.accessToken!);
              await prefs.setString('token', response.accessToken!);
              currentUser = await homeService.getUserInfo();
              isLogin.value = true;
            }

            emit(
              AuthLoginSuccess(
                accessToken: response.accessToken!,
              ),
            );
          } catch (e) {
            emit(
              AuthLoginErrorState(
                error: e.toString(),
              ),
            );
          }
        }
        // signUp
        if (event is AuthSignUpEvent) {
          emit(
            AuthSignUpLoadingState(),
          );
          try {
            await authService.register(event.authModel);
            emit(AuthSignUpSuccess());
          } catch (e) {
            emit(
              AuthLoginErrorState(
                error: e.toString(),
              ),
            );
          }
        }
      },
    );
  }
}
