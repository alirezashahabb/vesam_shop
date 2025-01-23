import 'package:flutter/material.dart';
import 'package:online_shop/data/model/home_model.dart';
import 'package:online_shop/widget/product_item.dart';

class ProductHorizantal extends StatelessWidget {
  final List<HomeProducts> producs;
  const ProductHorizantal({
    super.key,
    required this.themeData,
    required this.producs,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 244,
      child: ListView.builder(
        itemCount: producs.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var items = producs[index];
          return ProductItem(items: items, themeData: themeData);
        },
      ),
    );
  }
}
