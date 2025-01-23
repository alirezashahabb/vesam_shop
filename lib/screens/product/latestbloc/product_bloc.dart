import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:online_shop/data/model/product_model.dart';
import 'package:online_shop/data/services/product_service.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductLatestBloc extends Bloc<ProductEvent, ProductState> {
  final ProductService productService;
  ProductLatestBloc(this.productService) : super(ProductLatestLoadingState()) {
    on<ProductEvent>(
      (event, emit) async {
        // product latest
        if (event is ProductLatestInitEvent) {
          emit(ProductLatestLoadingState());
          try {
            var response = await productService.getLatestProduct();
            emit(ProductLatestSuccessState(productModel: response));
          } catch (e) {
            emit(
              ProductLatestErrorState(
                error: e.toString(),
              ),
            );
          }
        }
        // product latest
      },
    );
  }
}
