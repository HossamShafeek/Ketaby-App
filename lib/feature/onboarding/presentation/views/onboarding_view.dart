import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ketaby/core/utils/app_assets.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/widgets/background_image.dart';
import 'package:ketaby/feature/onboarding/presentation/views/widgets/onboarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(
          imagePath: AppAssets.splashImage,
        ),
        const Scaffold(
          backgroundColor: AppColors.transparent,
          resizeToAvoidBottomInset: false,
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: AppConstants.systemUiOverlayStyleDark,
            child: OnBoardingViewBody(),
          ),
        )
      ],
    );
  }
}
