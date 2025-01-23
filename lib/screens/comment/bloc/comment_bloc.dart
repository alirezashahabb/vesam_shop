import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:online_shop/data/model/product_detail_model.dart';
import 'package:online_shop/data/services/product_service.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final ProductService productService;
  CommentBloc(this.productService) : super(CommentInitial()) {
    on<CommentEvent>((event, emit) async {
      if (event is CommentSendEvent) {
        emit(CommentLoadingState());
        try {
          await productService.sendProductComment(event.comments);
          emit(CommentSuccessState());
        } catch (e) {
          emit(
            CommentErrorState(
              error: e.toString(),
            ),
          );
        }
      }
    });
  }
}
