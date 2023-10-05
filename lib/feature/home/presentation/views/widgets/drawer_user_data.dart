import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/utils/app_styles.dart';
import 'package:ketaby/feature/home/presentation/views/widgets/drawer_user_photp.dart';
import 'package:ketaby/feature/profile/presentation/cubits/get_user_profile_cubit/get_user_profile_cubit.dart';
import 'package:ketaby/feature/profile/presentation/cubits/get_user_profile_cubit/get_user_profile_state.dart';

class DrawerUserData extends StatelessWidget {
  const DrawerUserData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserProfileCubit,GetUserProfileState>(builder: (context, state) {
      if(state is GetUserProfileSuccessState){
        return Row(
          children: [
             DrawerUserPhoto(imagePath: state.profileModel.data!.image!,),
            SizedBox(width: AppConstants.padding10w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.profileModel.data!.name!,
                  maxLines: 1,
                  style: AppStyles.textStyle16.copyWith(
                    color: AppColors.white,
                  ),
                ),
                Text(
                  state.profileModel.data!.email!,
                  style: AppStyles.textStyle12,
                ),
              ],
            ),
          ],
        );
      }else{
        return const SizedBox();
      }
    },);
  }
}
