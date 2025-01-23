part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductInitState extends ProductState {}

// Latest Product
final class ProductLatestLoadingState extends ProductState {}

final class ProductLatestSuccessState extends ProductState {
  final ProductModel productModel;

  ProductLatestSuccessState({required this.productModel});
}

final class ProductLatestErrorState extends ProductState {
  final String error;

  ProductLatestErrorState({required this.error});
}
