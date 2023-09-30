import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ketaby/config/icons/icons_broken.dart';
import 'package:ketaby/core/utils/app_assets.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/utils/app_styles.dart';
import 'package:ketaby/feature/home/presentation/cubits/animated_drawer_cubit/animated_drawer_cubit.dart';
import 'package:ketaby/feature/home/presentation/cubits/animated_drawer_cubit/animated_drawer_state.dart';

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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, Hossam Shafeek!',
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
          const Spacer(),
          UserImage(
            imagePath: AppAssets.userImage,
            radiusForUserCircle: 20.sp,
            radiusForSmaleCircle: 22.sp,
            radiusForBigCircle: 24.sp,
          )
        ],
      ),
    );
  }
}

class UserImage extends StatelessWidget {
  const UserImage({
    Key? key,
    required this.imagePath,
    required this.radiusForBigCircle,
    required this.radiusForUserCircle,
    required this.radiusForSmaleCircle,
  }) : super(key: key);

  final String imagePath;
  final double radiusForSmaleCircle;
  final double radiusForBigCircle;
  final double radiusForUserCircle;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radiusForBigCircle,
      backgroundColor: AppColors.indigo,
      child: CircleAvatar(
        radius: radiusForSmaleCircle,
        backgroundColor: AppColors.white,
        child: CircleAvatar(
          radius: radiusForUserCircle,
          child: Image.asset(imagePath),
        ),
      ),
    );
  }
}
