import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/data/model/product_detail_model.dart';
import 'package:online_shop/them.dart';
import 'package:online_shop/utils/image_loading_service.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductSlider extends StatefulWidget {
  final ProductDetailModel productDetailModel;
  const ProductSlider({super.key, required this.productDetailModel});

  @override
  State<ProductSlider> createState() => _ProductSliderState();
}

class _ProductSliderState extends State<ProductSlider> {
  int selectedItem = 0;
  final CarouselSliderController carouselSliderController =
      CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CarouselSlider(
          carouselController: carouselSliderController,
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                selectedItem = index;
              });
            },
            height: 160.0,
            viewportFraction: 1,
            enlargeCenterPage: true,
          ),
          items: widget.productDetailModel.images!.map((i) {
            return ImageLoadingService(
              mainImage: 'https://flutter.vesam24.com/$i',
              radius: 12,
            );
          }).toList(),
        ),
        Positioned(
          bottom: 12,
          child: AnimatedSmoothIndicator(
            activeIndex: selectedItem,
            count: widget.productDetailModel.images!.length,
            effect: ExpandingDotsEffect(
              dotWidth: 7,
              dotHeight: 7,
              activeDotColor: AppColors.kPrimary500,
              dotColor: AppColors.kGray100,
            ),
          ),
        ),
        Positioned(
          right: 6,
          child: CircleAvatar(
            backgroundColor: AppColors.kGray100,
            foregroundColor: AppColors.kGray500,
            child: IconButton(
                onPressed: () {
                  carouselSliderController.previousPage();
                },
                icon: Icon(
                  Icons.chevron_left_outlined,
                )),
          ),
        ),
        Positioned(
          left: 6,
          child: CircleAvatar(
            backgroundColor: AppColors.kGray100,
            foregroundColor: AppColors.kGray500,
            child: IconButton(
                onPressed: () {
                  carouselSliderController.nextPage();
                },
                icon: Icon(
                  Icons.chevron_right_outlined,
                )),
          ),
        ),
      ],
    );
  }
}
