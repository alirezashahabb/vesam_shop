part of 'popular_bloc_bloc.dart';

@immutable
sealed class PopularBlocState {}

final class PopularBlocInitial extends PopularBlocState {}

final class PopularProductLoadingSate extends PopularBlocState {}

final class PopularProductSuccessSate extends PopularBlocState {
  final ProductModel productModel;

  PopularProductSuccessSate({required this.productModel});
}

final class PopularProductErrorSate extends PopularBlocState {
  final String error;

  PopularProductErrorSate({required this.error});
}
