import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_shop/screens/home/bloc/home_bloc.dart';
import 'package:online_shop/screens/product/latest_product_screen.dart';
import 'package:online_shop/screens/product/popular_product_screen.dart';
import 'package:online_shop/them.dart';
import 'package:online_shop/utils/navigator.dart';
import 'package:online_shop/widget/home_slider.dart';
import 'package:online_shop/widget/product_horizantal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/img/Logo.svg',
              width: 40,
              height: 40,
              colorFilter: const ColorFilter.mode(
                  AppColors.kPrimary500, BlendMode.srcIn),
            ),
            Text(
              'وسام شاپ',
            ),
          ],
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeSuccessState) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  spacing: 20,
                  children: [
                    // slider section
                    HomeSlider(
                      homeModel: state.homeModel,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'جدیدترین محصولات',
                          style: themeData.textTheme.bodyMedium!
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                goScreen(
                                  context: context,
                                  screen: LatestProductScreen(),
                                );
                              },
                              child: Text(
                                'مشاهده همه',
                                style: themeData.textTheme.bodySmall!.copyWith(
                                  color: AppColors.kInfo500,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: AppColors.kInfo500,
                            ),
                          ],
                        )
                      ],
                    ),
                    ProductHorizantal(
                      themeData: themeData,
                      producs: state.homeModel.news!,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'پربازدیدترین محصولات',
                          style: themeData.textTheme.bodyMedium!
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                goScreen(
                                  context: context,
                                  screen: PopularProductScreen(),
                                );
                              },
                              child: Text(
                                'مشاهده همه',
                                style: themeData.textTheme.bodySmall!.copyWith(
                                  color: AppColors.kInfo500,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: AppColors.kInfo500,
                            ),
                          ],
                        )
                      ],
                    ),
                    ProductHorizantal(
                      themeData: themeData,
                      producs: state.homeModel.mostVisited!,
                    )
                  ],
                ),
              ),
            );
          } else if (state is HomeErrorState) {
            return Center(
              child: Text(state.error),
            );
          } else {
            throw Exception('state is not support');
          }
        },
      ),
    );
  }
}
