import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/config/icons/icons_broken.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/utils/app_styles.dart';
import 'package:ketaby/core/widgets/user_image.dart';
import 'package:ketaby/feature/home/presentation/cubits/animated_drawer_cubit/animated_drawer_cubit.dart';
import 'package:ketaby/feature/home/presentation/cubits/animated_drawer_cubit/animated_drawer_state.dart';
import 'package:ketaby/feature/profile/presentation/cubits/get_user_profile_cubit/get_user_profile_cubit.dart';
import 'package:ketaby/feature/profile/presentation/cubits/get_user_profile_cubit/get_user_profile_state.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: AppConstants.defaultPadding,
        bottom: AppConstants.defaultPadding,
        top: AppConstants.padding25h,
      ),
      child: Row(
        children: [
          BlocBuilder<AnimatedDrawerCubit, AnimatedDrawerState>(
            builder: (context, state) {
              return IconButton(
                icon: AnimatedDrawerCubit.get(context).isOpenDrawer
                    ? Icon(
                        IconBroken.Arrow___Left_2,
                        size: AppConstants.iconSize33,
                        color: AppColors.indigo,
                      )
                    : Icon(
                        IconBroken.Filter,
                        size: AppConstants.iconSize28,
                        color: AppColors.indigo,
                      ),
                onPressed: () {
                  AnimatedDrawerCubit.get(context).isOpenDrawer
                      ? AnimatedDrawerCubit.get(context).closeDrawer()
                      : AnimatedDrawerCubit.get(context).openDrawer();
                },
              );
            },
          ),
          SizedBox(
            width: AppConstants.padding8w,
          ),
          BlocBuilder<GetUserProfileCubit,GetUserProfileState>(builder: (context, state) {
            if(state is GetUserProfileSuccessState){
              return Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, ${state.profileModel.data!.name!}!',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: AppStyles.textStyle16.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.indigo,
                      ),
                    ),
                    SizedBox(
                      height: AppConstants.padding3h,
                    ),
                    Text(
                      'What are you reading today?',
                      style: AppStyles.textStyle14,
                    ),
                  ],
                ),
              );
            }else{
              return const SizedBox();
            }
          },),
          const UserImage()
        ],
      ),
    );
  }
}


