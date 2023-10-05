import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/utils/app_strings.dart';
import 'package:ketaby/core/utils/app_styles.dart';
import 'package:ketaby/core/widgets/gradient_button.dart';
import 'package:ketaby/feature/profile/data/model/profile_model.dart';
import 'package:ketaby/feature/profile/presentation/cubits/get_user_profile_cubit/get_user_profile_cubit.dart';
import 'package:ketaby/feature/profile/presentation/cubits/update_user_profile_cubit/update_user_profile_cubit.dart';
import 'package:ketaby/feature/profile/presentation/cubits/update_user_profile_cubit/update_user_profile_state.dart';
import 'package:ketaby/feature/profile/presentation/views/widgets/image_user_profile.dart';
import 'package:ketaby/feature/profile/presentation/views/widgets/update_profile_texts_fields_section.dart';

class UpdateProfileViewBody extends StatelessWidget {
  const UpdateProfileViewBody({Key? key, required this.profileModel})
      : super(key: key);

  final ProfileModel profileModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.only(
        left: AppConstants.padding10h,
        right: AppConstants.padding10h,
        bottom: AppConstants.padding10h,
      ),
      child: Form(
        key: UpdateUserProfileCubit.get(context).formKey,
        child: Column(
          children: [
            BlocBuilder<UpdateUserProfileCubit,UpdateUserProfileState>(builder: (context, state) {
              if(state is UpdateUserProfileLoadingState){
                return Padding(
                  padding:  EdgeInsets.only(bottom:AppConstants.padding3h),
                  child: const LinearProgressIndicator(),
                );
              }else{
                return const SizedBox();
              }
            },),
            ImageUserProfile(imagePath: profileModel.data!.image!),
            const UpdateProfileTextsFieldsSection(),
            GradientButton(
              onPressed: () {
                if(UpdateUserProfileCubit.get(context).formKey.currentState!.validate()){
                  UpdateUserProfileCubit.get(context).updateUserProfile(context: context).then((value) {
                    GetUserProfileCubit.get(context).getUserProfile();
                    Navigator.pop(context);
                  });
                }
              },
              title: Text(
                AppStrings.update,
                style: AppStyles.textStyle16.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
