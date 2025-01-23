import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/data/model/home_model.dart';
import 'package:online_shop/them.dart';
import 'package:online_shop/utils/image_loading_service.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeSlider extends StatefulWidget {
  final HomeModel homeModel;
  const HomeSlider({
    super.key,
    required this.homeModel,
  });

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  setState(() {
                    selectedItem = index;
                  });
                },
                height: 160.0,
                autoPlay: true,
                viewportFraction: 1,
                enlargeCenterPage: true,
              ),
              items: widget.homeModel.slides!.map((i) {
                return ImageLoadingService(
                  mainImage: 'https://flutter.vesam24.com/${i.image}',
                  radius: 12,
                );
              }).toList(),
            ),
            Positioned(
              bottom: 12,
              child: AnimatedSmoothIndicator(
                activeIndex: selectedItem,
                count: widget.homeModel.slides!.length,
                effect: ExpandingDotsEffect(
                  dotWidth: 7,
                  dotHeight: 7,
                  activeDotColor: AppColors.kPrimary500,
                  dotColor: AppColors.kGray100,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
