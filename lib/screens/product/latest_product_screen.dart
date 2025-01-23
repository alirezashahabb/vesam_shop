import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_shop/screens/product/latestbloc/product_bloc.dart';
import 'package:online_shop/them.dart';
import 'package:online_shop/widget/product_grid_items.dart';

class LatestProductScreen extends StatefulWidget {
  const LatestProductScreen({super.key});

  @override
  State<LatestProductScreen> createState() => _LatestProductScreenState();
}

class _LatestProductScreenState extends State<LatestProductScreen> {
  @override
  void initState() {
    BlocProvider.of<ProductLatestBloc>(context).add(
      ProductLatestInitEvent(),
    );
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
      body: BlocBuilder<ProductLatestBloc, ProductState>(
          builder: (context, state) {
        if (state is ProductLatestLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ProductLatestSuccessState) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            child: Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'جدیدترین محصولات',
                  style: themeData.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Expanded(
                    child: GridView.builder(
                  itemCount: state.productModel.products!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 250,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 50,
                  ),
                  itemBuilder: (context, index) {
                    var products = state.productModel.products![index];
                    return Center(
                      child: ProductGridItems(
                          items: products, themeData: themeData),
                    );
                  },
                ))
              ],
            ),
          );
        } else if (state is ProductLatestErrorState) {
          return Center(
            child: Text(state.error),
          );
        } else {
          throw Exception('this state is not Support');
        }
      }),
    );
  }
}
