import 'package:flutter/material.dart';
import 'package:online_shop/data/model/home_model.dart';
import 'package:online_shop/data/model/user_peyment_model.dart';
import 'package:online_shop/screens/productDetail/product_detal.dart';
import 'package:online_shop/them.dart';
import 'package:online_shop/utils/date_formatter.dart';
import 'package:online_shop/utils/image_loading_service.dart';
import 'package:online_shop/utils/navigator.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class UserPaymentDetailScreen extends StatelessWidget {
  final UserPaymentModel userPaymentModel;

  const UserPaymentDetailScreen({super.key, required this.userPaymentModel});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('جزئیات فاکتور${userPaymentModel.factorCode!}'),
      ),
      body: ListView.separated(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 50),
          itemBuilder: (context, index) {
            var paymentDetail = userPaymentModel.invoiceDetails![index];
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                goScreen(
                  fullScreen: true,
                  context: context,
                  screen: ProductDetailScreen(
                    products: HomeProducts(
                      id: paymentDetail.productId,
                    ),
                  ),
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
                          'https://flutter.vesam24.com/${paymentDetail.productImage}',
                    ),
                  ),
                  Expanded(
                    child: Column(
                      spacing: 12,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          paymentDetail.productTitle!,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('تعداد',
                                style: themeData.textTheme.bodyMedium!.copyWith(
                                  color: AppColors.kGray500,
                                )),
                            Text('${paymentDetail.count}عدد')
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('تاریخ خرید',
                                style: themeData.textTheme.bodyMedium!.copyWith(
                                  color: AppColors.kGray500,
                                )),
                            Text(
                              '${convertDateAndTime(userPaymentModel.createDate!).$2} - ${convertDateAndTime(userPaymentModel.createDate!).$1}',
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('قیمت نهایی',
                                style: themeData.textTheme.bodyMedium!.copyWith(
                                  color: AppColors.kGray500,
                                )),
                            Text(
                                '${paymentDetail.finalPrice!.toStringAsFixed(0).seRagham()}تومان')
                          ],
                        ),
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
          itemCount: userPaymentModel.invoiceDetails!.length),
    );
  }
}
