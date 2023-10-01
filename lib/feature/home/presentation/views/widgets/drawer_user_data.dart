import 'package:flutter/material.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/utils/app_styles.dart';
import 'package:ketaby/feature/home/presentation/views/widgets/drawer_user_photp.dart';

class DrawerUserData extends StatelessWidget {
  const DrawerUserData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const DrawerUserPhoto(),
        SizedBox(width: AppConstants.padding10w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hossam Shafeek',
              //LoginCubit.get(context).loginModel!.data!.user!.name!,
              maxLines: 1,
              style: AppStyles.textStyle16.copyWith(
                color: AppColors.white,
              ),
            ),
            Text(
              'hossamshafik55@gmail.com',
              style: AppStyles.textStyle12,
            ),
          ],
        ),
      ],
    );
  }
}
