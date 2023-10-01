import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ketaby/config/icons/icons_broken.dart';
import 'package:ketaby/config/local/cache_helper.dart';
import 'package:ketaby/config/routes/app_routes.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/utils/app_styles.dart';
import 'package:ketaby/feature/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:ketaby/feature/onboarding/presentation/cubit/onboarding_state.dart';
import 'package:ketaby/feature/onboarding/presentation/views/widgets/onboarding_page_view.dart';
import 'package:ketaby/feature/onboarding/presentation/views/widgets/page_indicator_widget.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          children: [
            const SkipButton(),
            const OnBoardingPageView(),
            Padding(
              padding: EdgeInsets.only(bottom: AppConstants.padding50h),
              child: PageIndicatorWidget(
                pageController: OnBoardingCubit.get(context).pageController,
                count: OnBoardingCubit.get(context).boarding.length,
              ),
            ),
            const NextButton(),
          ],
        ),
      ),
    );
  }
}

class NextButton extends StatelessWidget {
  const NextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) {
        return Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: TextButton(
                onPressed: () {
                  if (!OnBoardingCubit.get(context).isLast) {
                    OnBoardingCubit.get(context).pageController.nextPage(
                          duration: const Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.linearToEaseOut,
                        );
                  } else {
                    CacheHelper.setBoolean(key: 'onBoarding', value: true)
                        .then((value) {
                      Navigator.pushReplacementNamed(context, Routes.loginView);
                    });
                  }
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      OnBoardingCubit.get(context).isLast
                          ? 'Get Started'
                          : 'Next',
                      style: AppStyles.textStyle22.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Baseline(
                      baseline: AppConstants.iconSize28,
                      baselineType: TextBaseline.alphabetic,
                      child: Icon(
                        IconBroken.Arrow___Right,
                        color: Colors.white,
                        size: AppConstants.iconSize28,
                      ),
                    )
                  ],
                )),
          ),
        );
      },
    );
  }
}

class SkipButton extends StatelessWidget {
  const SkipButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: TextButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, Routes.loginView);
          },
          child: Text(
            'Skip',
            style: AppStyles.textStyle20.copyWith(
              color: AppColors.white,
            ),
          )),
    );
  }
}
