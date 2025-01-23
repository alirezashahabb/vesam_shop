import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:online_shop/data/model/basket_model.dart';
import 'package:online_shop/data/model/payment_model.dart';
import 'package:online_shop/data/services/basket_service.dart';

part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  final BasketService basketService;
  BasketBloc(this.basketService) : super(BasketInitial()) {
    on<BasketEvent>(
      (event, emit) async {
        if (event is BasketItemInitEvent) {
          emit(BasketLoadingState());
          try {
            await basketService.addBasket(event.productId);
            emit(BasketSuccessState());
          } catch (e) {
            emit(
              BasketErrorState(
                error: e.toString(),
              ),
            );
          }
        }
        // Get Basket
        if (event is GetBasketInitEvent) {
          emit(GetBasketLoading());
          try {
            var response = await basketService.getAllBasket();
            emit(
              GetBasketSuccessState(
                basketModel: response,
              ),
            );
          } catch (e) {
            emit(GetBasketErrorState(
              error: e.toString(),
            ));
          }
        }
        //Increment
        if (event is IncrementBasketInitEvent) {
          emit(BasketIncrementLoadingState());
          try {
            await basketService.increaseCount(event.productId);
            emit(BasketIncrementSuccessState());
          } catch (e) {
            emit(BasketIncrementErrorState(
              error: e.toString(),
            ));
          }
        }
        //Decrement
        if (event is DecrementBasketInitEvent) {
          emit(BasketDecrementLoadingState());
          try {
            await basketService.decreesCount(event.productId);
            emit(BasketDecrementSuccessState());
          } catch (e) {
            emit(
              BasketDecrementErrorState(
                error: e.toString(),
              ),
            );
          }
        }
        //deleted
        if (event is DeletedBasketInitEvent) {
          emit(BasketDeletedLoadingState());
          try {
            await basketService.removeProductsFromBasket(event.productId);
            emit(BasketDeletedSuccessState());
          } catch (e) {
            emit(
              BasketDeletedErrorState(
                error: e.toString(),
              ),
            );
          }
        }
        //Payment
        if (event is BasketPaymentProductEvent) {
          emit(BasketPaymentLadingState());
          try {
            var response = await basketService.payment(event.paymentModel);
            emit(BasketPaymentSuccessState(payment: response));
          } catch (e) {
            emit(
              BasketPaymentErrorState(
                error: e.toString(),
              ),
            );
          }
        }
      },
    );
  }
}
