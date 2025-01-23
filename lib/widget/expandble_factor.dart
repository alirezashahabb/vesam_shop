import 'package:flutter/material.dart';
import 'package:online_shop/data/model/basket_model.dart';
import 'package:online_shop/screens/basket/payment.dart';
import 'package:online_shop/them.dart';
import 'package:online_shop/utils/navigator.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class ExpandableFactor extends StatefulWidget {
  final BasketModel basketModel;
  const ExpandableFactor({
    super.key,
    required this.basketModel,
  });

  @override
  State<ExpandableFactor> createState() => _ExpandableFactorState();
}

class _ExpandableFactorState extends State<ExpandableFactor> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
        height: isExpanded ? 220 : 120,
        decoration: BoxDecoration(
          color: AppColors.kWhite,
          boxShadow: [
            BoxShadow(
              color: AppColors.kGray200,
              blurRadius: 2,
            ),
          ],
        ),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            spacing: 8,
            children: [
              Row(
                children: [
                  isExpanded
                      ? Icon(
                          Icons.keyboard_arrow_down,
                        )
                      : Icon(
                          Icons.keyboard_arrow_up,
                        ),
                  Expanded(
                    child: isExpanded
                        ? Text(
                            'بستن فاکتور',
                          )
                        : Text(
                            'مشاهده فاکتور',
                          ),
                  ),
                  isExpanded
                      ? SizedBox()
                      : Text(
                          '${widget.basketModel.totalFinalPrice!.toStringAsFixed(0).seRagham()} تومان',
                        ),
                ],
              ),
              isExpanded
                  ? Column(
                      spacing: 8,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('جمع کل',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: AppColors.kGray500,
                                    )),
                            Text(
                              '${widget.basketModel.totalPrice!.toStringAsFixed(0).seRagham()} تومان',
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('مبلغ تخفیف',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: AppColors.kGray500,
                                    )),
                            Text(
                              '${widget.basketModel.totalDiscountPrice!.toStringAsFixed(0).seRagham()} تومان',
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('مبلغ نهایی',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: AppColors.kGray500,
                                    )),
                            Text(
                              '${widget.basketModel.totalFinalPrice!.toStringAsFixed(0).seRagham()} تومان',
                            ),
                          ],
                        ),
                      ],
                    )
                  : SizedBox(),
              Container(
                margin: EdgeInsets.only(top: 8),
                width: MediaQuery.sizeOf(context).width,
                child: ElevatedButton(
                  onPressed: () {
                    goScreen(
                      context: context,
                      screen: PayMentScreen(),
                    );
                  },
                  child: Text('تکمیل خرید'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
