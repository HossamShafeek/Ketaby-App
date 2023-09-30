import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageIndicatorWidget extends StatelessWidget {
  const PageIndicatorWidget({
    Key? key,
    this.spacing,
    this.radius,
    this.dotWidth,
    this.dotHeight,
    this.dotColor,
    this.activeDotColor,
    required this.pageController,
    required this.count,
  }) : super(key: key);

  final double? spacing, radius, dotWidth, dotHeight;
  final Color? dotColor, activeDotColor;
  final PageController pageController;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return SmoothPageIndicator(
        controller: pageController,
        count: count,
        effect: ExpandingDotsEffect(
          dotColor: AppColors.grey400,
          dotHeight: 10,
          dotWidth: 10,
          expansionFactor: 4,
          spacing: 5,
          activeDotColor: Colors.white,
        ),
      );
    });
  }
}
