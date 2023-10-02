import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/config/local/cache_helper.dart';
import 'package:ketaby/config/routes/app_routes.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/utils/app_strings.dart';
import 'package:ketaby/core/utils/app_styles.dart';
import 'package:ketaby/core/widgets/custom_error_widget.dart';
import 'package:ketaby/core/widgets/gradient_button.dart';
import 'package:ketaby/core/widgets/loading_indicator_widget.dart';
import 'package:ketaby/feature/profile/presentation/cubits/get_user_profile_cubit.dart';
import 'package:ketaby/feature/profile/presentation/cubits/get_user_profile_state.dart';
import 'package:ketaby/feature/profile/presentation/views/widgets/image_user_profile.dart';
import 'package:ketaby/feature/profile/presentation/views/widgets/name_and_email_user_profile.dart';
import 'package:ketaby/feature/profile/presentation/views/widgets/profile_item_widget.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserProfileCubit, GetUserProfileState>(
      builder: (context, state) {
        if (state is GetUserProfileSuccessState) {
          return SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                left: AppConstants.defaultPadding,
                right: AppConstants.defaultPadding,
              ),
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const ImageUserProfile(),
                  NameAndEmailUserProfile(
                    name: state.profileModel.data!.name!,
                    email: state.profileModel.data!.email!,
                  ),
                  ProfileItemWidget(
                      title: 'Name',
                      content: state.profileModel.data!.name!,
                      onTap: () {}),
                  ProfileItemWidget(
                      title: 'Email',
                      content: state.profileModel.data!.email!,
                      onTap: () {}),
                  ProfileItemWidget(
                      title: 'Phone',
                      content: state.profileModel.data!.phone!,
                      onTap: () {}),
                  ProfileItemWidget(
                      title: 'City',
                      content: state.profileModel.data!.city!,
                      onTap: () {}),
                  ProfileItemWidget(
                      title: 'Address',
                      content: state.profileModel.data!.address!,
                      onTap: () {}),
                  SizedBox(
                    height: AppConstants.padding20h,
                  ),
                  GradientButton(
                    onPressed: () {
                      CacheHelper.removeData(key: 'token').then((value) {
                        Navigator.pushReplacementNamed(
                            context, Routes.loginView);
                      });
                    },
                    title: Text(
                      AppStrings.logout,
                      style: AppStyles.textStyle16
                          .copyWith(color: AppColors.white),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state is GetUserProfileFailureState) {
          return CustomErrorWidget(error: state.error);
        } else {
          return const LoadingIndicatorWidget();
        }
      },
    );
  }
}
