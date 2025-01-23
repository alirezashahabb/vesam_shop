import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:online_shop/data/local/favariot_product_manager.dart';
import 'package:online_shop/screens/productDetail/product_detal.dart';
import 'package:online_shop/them.dart';
import 'package:online_shop/utils/image_loading_service.dart';
import 'package:online_shop/utils/navigator.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('لیست موردعلاقه‌ها'),
        ),
        body: ValueListenableBuilder(
          valueListenable:
              FavoriteProductManager.favoriteProductBox.listenable(),
          builder: (context, products, child) {
            return products.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/img/faviraiot.svg',
                          width: 250,
                        ),
                        Text('لیست موردعلاقه‌های شما خالی می‌باشد')
                      ],
                    ),
                  )
                : ListView.separated(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 50),
                    itemBuilder: (context, index) {
                      var product = products.values.toList()[index];
                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          goScreen(
                            context: context,
                            screen: ProductDetailScreen(products: product),
                            fullScreen: true,
                          );
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 8,
                          children: [
                            SizedBox(
                              width: 70,
                              height: 70,
                              child: ImageLoadingService(
                                mainImage:
                                    'https://flutter.vesam24.com/${product.image}',
                              ),
                            ),
                            Expanded(
                              child: Column(
                                spacing: 12,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(product.title!),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          product.hasDiscount!
                                              ? Text(
                                                  '${product.price!.toStringAsFixed(0).seRagham()}تومان',
                                                  style: themeData
                                                      .textTheme.labelSmall!
                                                      .copyWith(
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                  ))
                                              : Text('',
                                                  style: themeData
                                                      .textTheme.labelSmall!),
                                          // After Discount
                                          product.hasDiscount!
                                              ? Text(
                                                  '${product.discountPrice!.toStringAsFixed(0).seRagham()}تومان',
                                                )
                                              : Text(
                                                  '${product.price!.toStringAsFixed(0).seRagham()}تومان',
                                                ),
                                        ],
                                      ),
                                      CircleAvatar(
                                        backgroundColor: AppColors.kGray100,
                                        child: IconButton(
                                          splashRadius: 20,
                                          onPressed: () async {
                                            CherryToast.success(
                                              toastDuration:
                                                  Duration(seconds: 2),
                                              title: Text(
                                                'محصول با موفقیت از لیست حذف شد',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                              ),
                                            ).show(context);
                                            await product.delete();
                                          },
                                          icon: Icon(
                                            Icons.delete_outline,
                                            color: AppColors.kGray900,
                                            size: 20,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemCount: products.length,
                  );
          },
        ));
  }
}
