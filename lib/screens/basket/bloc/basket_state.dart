part of 'basket_bloc.dart';

@immutable
sealed class BasketState {}

final class BasketInitial extends BasketState {}

class BasketSuccessState extends BasketState {}

class BasketLoadingState extends BasketState {}

class BasketErrorState extends BasketState {
  final String error;

  BasketErrorState({
    required this.error,
  });
}

// Get Basket Items
class GetBasketLoading extends BasketState {}

class GetBasketSuccessState extends BasketState {
  final BasketModel basketModel;

  GetBasketSuccessState({
    required this.basketModel,
  });
}

class GetBasketErrorState extends BasketState {
  final String error;

  GetBasketErrorState({
    required this.error,
  });
}

//Increment

class BasketIncrementSuccessState extends BasketState {}

class BasketIncrementErrorState extends BasketState {
  final String error;

  BasketIncrementErrorState({
    required this.error,
  });
}

class BasketIncrementLoadingState extends BasketState {}

//Decrement

class BasketDecrementSuccessState extends BasketState {}

class BasketDecrementErrorState extends BasketState {
  final String error;

  BasketDecrementErrorState({
    required this.error,
  });
}

class BasketDecrementLoadingState extends BasketState {}

//delete BasketItems

class BasketDeletedSuccessState extends BasketState {}

class BasketDeletedErrorState extends BasketState {
  final String error;

  BasketDeletedErrorState({
    required this.error,
  });
}

class BasketDeletedLoadingState extends BasketState {}

// Payment

class BasketPaymentLadingState extends BasketState {}

class BasketPaymentSuccessState extends BasketState {
  final String payment;
  BasketPaymentSuccessState({
    required this.payment,
  });
}

class BasketPaymentErrorState extends BasketState {
  final String error;
  BasketPaymentErrorState({
    required this.error,
  });
}
