import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:online_shop/data/model/home_model.dart';
import 'package:online_shop/data/model/uder_model.dart';
import 'package:online_shop/data/services/home_service.dart';
import 'package:online_shop/main.dart';

part 'home_event.dart';
part 'home_state.dart';

UserModel? currentUser;

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeService homeService;
  HomeBloc(this.homeService) : super(HomeLoadingState()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeInitEvent) {
        try {
          emit(HomeLoadingState());
          var respnse = await homeService.getGeneralInfo();
          if (isLogin.value) {
            currentUser = await homeService.getUserInfo();
          }
          emit(
            HomeSuccessState(homeModel: respnse),
          );
        } catch (e) {
          emit(
            HomeErrorState(
              error: e.toString(),
            ),
          );
        }
      }
    });
  }
}
