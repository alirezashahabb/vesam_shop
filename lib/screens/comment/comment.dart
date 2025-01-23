import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_shop/data/model/product_detail_model.dart';
import 'package:online_shop/screens/comment/bloc/comment_bloc.dart';
import 'package:online_shop/screens/productDetail/bloc/prodcut_detail_bloc.dart';

class CommentScreen extends StatefulWidget {
  final int productId;
  const CommentScreen({super.key, required this.productId});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final FormKey = GlobalKey<FormState>();
  final TextEditingController textController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocConsumer<CommentBloc, CommentState>(
        listener: (context, state) {
          if (state is CommentSuccessState) {
            BlocProvider.of<ProductDetailBloc>(context).add(
              ProductDetailEventInit(
                id: widget.productId,
              ),
            );
            CherryToast.success(
              toastDuration: Duration(seconds: 2),
              title: Text(
                'نظر شما با موفقیت ثبت شد',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ).show(context);
          }
        },
        builder: (context, state) {
          return Container(
            height: 85,
            padding: EdgeInsets.fromLTRB(
              16,
              15,
              16,
              25,
            ),
            child: ElevatedButton(
              onPressed: () {
                if (FormKey.currentState!.validate()) {
                  BlocProvider.of<CommentBloc>(context).add(CommentSendEvent(
                      comments: Comments(
                          subject: subjectController.text,
                          productId: widget.productId,
                          text: textController.text)));
                }
              },
              child: Text(
                'ثبت نظر',
              ),
            ),
          );
        },
      ),
      appBar: AppBar(
        title: Text(
          'ثبت نظر',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(16, 10, 16, 20),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Form(
            key: FormKey,
            child: Column(
              spacing: 20,
              children: [
                SvgPicture.asset(
                  'assets/img/comment.svg',
                  width: 200,
                  height: 200,
                ),
                TextFormField(
                  controller: subjectController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'وارد کردن عنوان الزامی هست';
                    }
                    return null;
                  },
                  // when touch next automatically next text felid
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    label: Text('عنوان دیدگاه'),
                  ),
                ),
                TextFormField(
                  controller: textController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'وارد کردن دیدگاه الزامی هست';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.done,
                  maxLines: 5,
                  decoration: InputDecoration(
                    label: Text('متن دیدگاه'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
