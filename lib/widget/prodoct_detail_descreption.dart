import 'package:flutter/material.dart';
import 'package:online_shop/data/model/product_detail_model.dart';
import 'package:online_shop/them.dart';
import 'package:read_more_text/read_more_text.dart';

class ProductDescreption extends StatelessWidget {
  final ProductDetailModel productDetailModel;
  const ProductDescreption({super.key, required this.productDetailModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'توضیحات محصول',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
          ReadMoreText(
            productDetailModel.description!,
            numLines: 2,
            readMoreAlign: Alignment.center,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: AppColors.kGray500, height: 1.7),
            readMoreText: ' مشاهده بیشتر',
            readLessText: 'بستن',
          ),
        ],
      ),
    );
  }
}
