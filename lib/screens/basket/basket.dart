// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_shop/main.dart';
import 'package:online_shop/screens/basket/bloc/basket_bloc.dart';
import 'package:online_shop/screens/guest_screen.dart';
import 'package:online_shop/screens/profile/bloc/profile_bloc.dart';
import 'package:online_shop/them.dart';
import 'package:online_shop/utils/image_loading_service.dart';
import 'package:online_shop/utils/snack_bar.dart';
import 'package:online_shop/widget/expandble_factor.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:uni_links/uni_links.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  bool isFirstBuild = true;

  StreamSubscription? sub;

  @override
  void initState() {
    sub = getLinksStream().listen((event) {
      if (event != null && event == 'vesam://success_payment') {
        showCustomAlert(context, 'پرداخت با موفقیت انجام شد');
        Navigator.pop(context);
        BlocProvider.of<BasketBloc>(context).add(
          GetBasketInitEvent(),
        );
        BlocProvider.of<ProfileBloc>(context).add(UserPaymentInitEvent());
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'سبدخرید',
        ),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: isLogin,
        builder: (context, value, child) {
          if (isLogin.value) {
            BlocProvider.of<BasketBloc>(context).add(
              GetBasketInitEvent(),
            );
          }
          if (value) {
            return BlocConsumer<BasketBloc, BasketState>(
              listener: (context, state) {
                if (state is BasketSuccessState) {
                  showCustomAlert(
                    context,
                    'محصول با موفقیت به سبد خرید اضافه شد',
                  );
                  BlocProvider.of<BasketBloc>(context).add(
                    GetBasketInitEvent(),
                  );
                }
                if (state is BasketDeletedSuccessState ||
                    state is BasketIncrementSuccessState ||
                    state is BasketDecrementSuccessState) {
                  BlocProvider.of<BasketBloc>(context).add(
                    GetBasketInitEvent(),
                  );
                }
              },
              buildWhen: (previous, current) {
                if (current is GetBasketSuccessState ||
                    current is GetBasketErrorState ||
                    (current is GetBasketLoading && isFirstBuild)) {
                  return true;
                }
                return false;
              },
              builder: (context, state) {
                if (state is GetBasketSuccessState) {
                  isFirstBuild = false;
                  return state.basketModel.items!.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 8,
                            children: [
                              SvgPicture.asset(
                                'assets/img/basket_empty.svg',
                                width: 200,
                                height: 300,
                              ),
                              Text('سبد خرید خالی هست!'),
                            ],
                          ),
                        )
                      : Column(
                          children: [
                            Expanded(
                              child: ListView.separated(
                                  padding: EdgeInsets.fromLTRB(16, 16, 16, 50),
                                  itemBuilder: (context, index) {
                                    var products =
                                        state.basketModel.items![index];
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      spacing: 8,
                                      children: [
                                        SizedBox(
                                          width: 70,
                                          height: 70,
                                          child: ImageLoadingService(
                                            mainImage:
                                                'https://flutter.vesam24.com/${products.productImage}',
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            spacing: 10,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      products.productTitle!,
                                                      style: themeData
                                                          .textTheme.bodySmall,
                                                    ),
                                                  ),
                                                  IconButton(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    padding: EdgeInsets.zero,
                                                    onPressed: () {
                                                      BlocProvider.of<
                                                                  BasketBloc>(
                                                              context)
                                                          .add(
                                                        DeletedBasketInitEvent(
                                                            productId: products
                                                                .productId!),
                                                      );
                                                    },
                                                    icon: Icon(
                                                      Icons.delete_outline,
                                                      color: AppColors.kGray500,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Column(
                                                    spacing: 5,
                                                    children: [
                                                      products.discountPercent! >
                                                              0
                                                          ? Text(
                                                              '${products.price!.toStringAsFixed(0).seRagham()}تومان',
                                                              style: themeData
                                                                  .textTheme
                                                                  .labelSmall!
                                                                  .copyWith(
                                                                decoration:
                                                                    TextDecoration
                                                                        .lineThrough,
                                                              ))
                                                          : Text('',
                                                              style: themeData
                                                                  .textTheme
                                                                  .labelSmall!),
                                                      // After Discount
                                                      products.discountPercent! >
                                                              0
                                                          ? Text(
                                                              '${products.finalPrice!.toStringAsFixed(0).seRagham()}تومان',
                                                            )
                                                          : Text(
                                                              '${products.price!.toStringAsFixed(0).seRagham()}تومان',
                                                            ),
                                                    ],
                                                  ),
                                                  Row(
                                                    spacing: 15,
                                                    children: [
                                                      CircleAvatar(
                                                        radius: 18,
                                                        backgroundColor:
                                                            AppColors
                                                                .kPrimary500,
                                                        child: IconButton(
                                                          onPressed: () {
                                                            BlocProvider.of<
                                                                        BasketBloc>(
                                                                    context)
                                                                .add(
                                                              IncrementBasketInitEvent(
                                                                  productId:
                                                                      products
                                                                          .productId!),
                                                            );
                                                          },
                                                          icon: Icon(
                                                            Icons.add,
                                                            color: AppColors
                                                                .kWhite,
                                                            size: 18,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        products.count
                                                            .toString(),
                                                      ),
                                                      CircleAvatar(
                                                        radius: 18,
                                                        backgroundColor:
                                                            products.count == 1
                                                                ? AppColors
                                                                    .kGray100
                                                                : AppColors
                                                                    .kGray200,
                                                        child: IconButton(
                                                          onPressed:
                                                              products.count ==
                                                                      1
                                                                  ? null
                                                                  : () {
                                                                      BlocProvider.of<BasketBloc>(
                                                                              context)
                                                                          .add(
                                                                        DecrementBasketInitEvent(
                                                                            productId:
                                                                                products.productId!),
                                                                      );
                                                                    },
                                                          icon: Icon(
                                                            Icons.remove,
                                                            color: AppColors
                                                                .kWhite,
                                                            size: 18,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return Divider();
                                  },
                                  itemCount: state.basketModel.items!.length),
                            ),
                            ExpandableFactor(
                              basketModel: state.basketModel,
                            ),
                          ],
                        );
                } else if (state is GetBasketErrorState) {
                  return Center(
                    child: Text(state.error),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            );
          } else {
            return GuestScreen();
          }
        },
      ),
    );
  }
}


// &&