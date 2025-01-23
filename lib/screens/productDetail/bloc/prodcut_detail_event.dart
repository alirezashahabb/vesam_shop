part of 'prodcut_detail_bloc.dart';

@immutable
sealed class ProductDetailEvent {}

class ProductDetailEventInit extends ProductDetailEvent {
  final int id;

  ProductDetailEventInit({required this.id});
}
