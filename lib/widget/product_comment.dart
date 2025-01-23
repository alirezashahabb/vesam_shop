import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_shop/data/model/product_detail_model.dart';
import 'package:online_shop/main.dart';
import 'package:online_shop/screens/comment/comment.dart';
import 'package:online_shop/them.dart';
import 'package:online_shop/utils/navigator.dart';

class ProductComment extends StatelessWidget {
  final ProductDetailModel product;
  const ProductComment({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Column(
      spacing: 20,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'نظرات کاربران',
              style: themeData.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            ValueListenableBuilder(
              valueListenable: isLogin,
              builder: (context, value, child) {
                return value
                    ? TextButton(
                        onPressed: () {
                          goScreen(
                            context: context,
                            screen: CommentScreen(
                              productId: product.id!,
                            ),
                          );
                        },
                        child: Text(
                          'ثبت نظر',
                          style: themeData.textTheme.bodyMedium!.copyWith(
                            color: AppColors.kInfo400,
                          ),
                        ),
                      )
                    : SizedBox();
              },
            )
          ],
        ),
        product.comments!.isEmpty
            ? Center(
                child: Column(
                  spacing: 8,
                  children: [
                    SvgPicture.asset(
                      'assets/img/comment.svg',
                      width: 150,
                      height: 150,
                    ),
                    Text('برای این محصول هیچ دیدگاهی ثبت نشده!')
                  ],
                ),
              )
            : ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var items = product.comments![index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 5,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              items.subject!,
                            ),
                          ),
                          Text(
                            items.userEmail!,
                            style: themeData.textTheme.bodySmall!.copyWith(
                              color: AppColors.kGray500,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        items.text!,
                        style: themeData.textTheme.bodySmall!.copyWith(
                          color: AppColors.kGray500,
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: AppColors.kGray200,
                  );
                },
                itemCount: product.comments!.length)
      ],
    );
  }
}
