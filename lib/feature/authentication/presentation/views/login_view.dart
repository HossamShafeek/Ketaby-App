import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ketaby/core/utils/app_assets.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/widgets/background_image.dart';
import 'package:ketaby/feature/authentication/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(
          imagePath: AppAssets.backgroundImage,
        ),
        const Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.transparent,
          body: AnnotatedRegion(
            value: AppConstants.systemUiOverlayStyleDark,
            child: LoginViewBody(),
          ),
        )
      ],
    );
  }
}
