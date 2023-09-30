import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_styles.dart';
import 'package:ketaby/core/widgets/loading_indicator_widget.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 60.h, bottom: 70.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Ketaby',
              style: AppStyles.textStyle40.copyWith(
                color: AppColors.white,
              ),
            ),
            LoadingIndicatorWidget(strokeWidth: 3.5.h),
          ],
        ),
      ),
    );
  }
}
