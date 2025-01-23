import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:online_shop/data/model/product_detail_model.dart';
import 'package:online_shop/data/services/product_service.dart';

part 'prodcut_detail_event.dart';
part 'prodcut_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final ProductService productService;
  ProductDetailBloc(this.productService) : super(ProductDetailLoadingState()) {
    on<ProductDetailEvent>((event, emit) async {
      if (event is ProductDetailEventInit) {
        emit(ProductDetailLoadingState());
        try {
          var response = await productService.getProductDetail(event.id);
          emit(
            ProductDetailSuccessState(productDetailModel: response),
          );
        } catch (e) {
          emit(
            ProductDetailErrorState(
              error: e.toString(),
            ),
          );
        }
      }
    });
  }
}
