import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:online_shop/data/model/product_model.dart';
import 'package:online_shop/data/services/product_service.dart';

part 'popular_bloc_event.dart';
part 'popular_bloc_state.dart';

class PopularBloc extends Bloc<PopularBlocEvent, PopularBlocState> {
  final ProductService productService;
  PopularBloc(this.productService) : super(PopularProductLoadingSate()) {
    on<PopularBlocEvent>((event, emit) async {
      if (event is ProductPopularInitEvent) {
        emit(PopularProductLoadingSate());
        try {
          var response = await productService.getPopularProduct();
          emit(PopularProductSuccessSate(productModel: response));
        } catch (e) {
          emit(
            PopularProductErrorSate(
              error: e.toString(),
            ),
          );
        }
      }
    });
  }
}
