part of 'basket_bloc.dart';

@immutable
sealed class BasketEvent {}

class BasketItemInitEvent extends BasketEvent {
  final int productId;

  BasketItemInitEvent({required this.productId});
}

// Get Basket Items

class GetBasketInitEvent extends BasketEvent {}

// Increment

class IncrementBasketInitEvent extends BasketEvent {
  final int productId;

  IncrementBasketInitEvent({
    required this.productId,
  });
}

//Decrement
class DecrementBasketInitEvent extends BasketEvent {
  final int productId;

  DecrementBasketInitEvent({
    required this.productId,
  });
}

//deleted

class DeletedBasketInitEvent extends BasketEvent {
  final int productId;

  DeletedBasketInitEvent({
    required this.productId,
  });
}

// payment
class BasketPaymentProductEvent extends BasketEvent {
  final PaymentModel paymentModel;
  BasketPaymentProductEvent({
    required this.paymentModel,
  });
}
