import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_shop/data/model/home_model.dart';
import 'package:online_shop/screens/productDetail/product_detal.dart';
import 'package:online_shop/screens/profile/bloc/profile_bloc.dart';
import 'package:online_shop/them.dart';
import 'package:online_shop/utils/date_formatter.dart';
import 'package:online_shop/utils/image_loading_service.dart';
import 'package:online_shop/utils/navigator.dart';

class UserCommentScreen extends StatefulWidget {
  const UserCommentScreen({super.key});

  @override
  State<UserCommentScreen> createState() => _UserCommentScreenState();
}

class _UserCommentScreenState extends State<UserCommentScreen> {
  @override
  void initState() {
    BlocProvider.of<ProfileBloc>(context).add(UserCommentInitEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('نظرات من'),
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is UserCommentSuccessState) {
            return state.userComment.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10,
                      children: [
                        SvgPicture.asset(
                          'assets/img/comment.svg',
                          width: 250,
                          height: 250,
                        ),
                        Text(
                          'شما نظری ثبت نکرده‌اید!!',
                        ),
                      ],
                    ),
                  )
                : ListView.separated(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 50),
                    itemBuilder: (context, index) {
                      var items = state.userComment[index];
                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          goScreen(
                            fullScreen: true,
                            context: context,
                            screen: ProductDetailScreen(
                              products: HomeProducts(id: items.productId),
                            ),
                          );
                        },
                        child: Row(
                          spacing: 6,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 70,
                              height: 70,
                              child: ImageLoadingService(
                                mainImage:
                                    'https://flutter.vesam24.com/${items.productImage}',
                              ),
                            ),
                            Expanded(
                              child: Column(
                                spacing: 8,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    items.productTitle!,
                                    style: themeData.textTheme.bodySmall,
                                  ),
                                  Text(
                                    '${convertDateAndTime(items.createDate!).$2} - ${convertDateAndTime(items.createDate!).$1}',
                                    style: themeData.textTheme.labelSmall,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: AppColors.kGray50,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Column(
                                      spacing: 4,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          items.subject!,
                                          style: themeData.textTheme.bodySmall!
                                              .copyWith(
                                                  fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          items.text!,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: AppColors.kGray200,
                      );
                    },
                    itemCount: state.userComment.length,
                  );
          } else if (state is UserCommentErrorState) {
            return Center(
              child: Text(state.error),
            );
          } else {
            return Center(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
