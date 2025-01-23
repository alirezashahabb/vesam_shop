import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/data/model/home_model.dart';
import 'package:online_shop/screens/basket/bloc/basket_bloc.dart';
import 'package:online_shop/screens/productDetail/product_detal.dart';
import 'package:online_shop/them.dart';
import 'package:online_shop/utils/image_loading_service.dart';
import 'package:online_shop/utils/navigator.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class ProductGridItems extends StatelessWidget {
  final HomeProducts items;
  final ThemeData themeData;
  const ProductGridItems(
      {super.key, required this.items, required this.themeData});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            goScreen(
              context: context,
              screen: ProductDetailScreen(products: items),
              fullScreen: true,
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              Container(
                margin: EdgeInsets.only(left: 22),
                height: 156,
                width: 156,
                child: ImageLoadingService(
                  mainImage: 'https://flutter.vesam24.com/${items.image}',
                ),
              ),
              SizedBox(
                width: 170,
                child: Text(
                  items.title!,
                  style: themeData.textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 40,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Before Discount
                      items.hasDiscount!
                          ? Text(
                              '${items.price!.toStringAsFixed(0).seRagham()}تومان',
                              style: themeData.textTheme.labelSmall!.copyWith(
                                decoration: TextDecoration.lineThrough,
                              ))
                          : Text('', style: themeData.textTheme.labelSmall!),
                      // After Discount
                      items.hasDiscount!
                          ? Text(
                              '${items.discountPrice!.toStringAsFixed(0).seRagham()}تومان',
                            )
                          : Text(
                              '${items.price!.toStringAsFixed(0).seRagham()}تومان',
                            ),
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: AppColors.kPrimary500,
                    radius: 18,
                    child: IconButton(
                      onPressed: () {
                        BlocProvider.of<BasketBloc>(context).add(
                          BasketItemInitEvent(productId: items.id!),
                        );
                      },
                      icon: Icon(
                        Icons.add,
                        size: 18,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: AppColors.kWhite,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: AppColors.kGray100, blurRadius: 1, spreadRadius: 1)
              ],
            ),
            child: Icon(Icons.favorite_outline_sharp),
          ),
        )
      ],
    );
  }
}
