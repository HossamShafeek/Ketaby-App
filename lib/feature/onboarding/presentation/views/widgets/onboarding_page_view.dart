import 'package:flutter/material.dart';
import 'package:ketaby/core/animations/fade_transition_animation.dart';
import 'package:ketaby/core/animations/slide_transition_animation.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/utils/app_styles.dart';
import 'package:ketaby/feature/onboarding/presentation/cubit/onboarding_cubit.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(top: AppConstants.padding20h),
        child: SlideTransitionAnimation(
          duration: const Duration(seconds: 2),
          begin: const Offset(0, 0.1),
          end: Offset.zero,
          child: FadeTransitionAnimation(
            duration: const Duration(seconds: 3),
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: OnBoardingCubit.get(context).pageController,
              itemCount: OnBoardingCubit.get(context).boarding.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Image.asset(
                      OnBoardingCubit.get(context).boarding[index].image,
                      height: 280,
                    )),
                    Padding(
                      padding: EdgeInsets.only(
                        top: AppConstants.padding30h,
                        bottom: AppConstants.padding10h,
                      ),
                      child: Text(
                        OnBoardingCubit.get(context).boarding[index].title,
                        style: AppStyles.textStyle22,
                      ),
                    ),
                    Text(
                      OnBoardingCubit.get(context).boarding[index].body,
                      style: AppStyles.textStyle14.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                );
              },
              onPageChanged: (int index) {
                OnBoardingCubit.get(context).onChangePageView(index);
              },
            ),
          ),
        ),
      ),
    );
  }
}
