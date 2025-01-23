part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeErrorState extends HomeState {
  final String error;

  HomeErrorState({required this.error});
}

final class HomeSuccessState extends HomeState {
  final HomeModel homeModel;

  HomeSuccessState({
    required this.homeModel,
  });
}
