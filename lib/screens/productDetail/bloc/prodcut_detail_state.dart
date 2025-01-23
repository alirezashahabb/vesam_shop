part of 'prodcut_detail_bloc.dart';

@immutable
sealed class ProductDetailState {}

final class ProductDetailInitial extends ProductDetailState {}

final class ProductDetailLoadingState extends ProductDetailState {}

final class ProductDetailErrorState extends ProductDetailState {
  final String error;

  ProductDetailErrorState({required this.error});
}

final class ProductDetailSuccessState extends ProductDetailState {
  final ProductDetailModel productDetailModel;

  ProductDetailSuccessState({required this.productDetailModel});
}
