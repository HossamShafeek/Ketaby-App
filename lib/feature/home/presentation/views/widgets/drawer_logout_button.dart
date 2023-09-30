import 'package:flutter/material.dart';
import 'package:ketaby/config/icons/icons_broken.dart';
import 'package:ketaby/config/local/cache_helper.dart';
import 'package:ketaby/config/routes/app_routes.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/utils/app_styles.dart';
import 'package:ketaby/feature/home/presentation/cubits/animated_drawer_cubit/animated_drawer_cubit.dart';

class DrawerLogoutButton extends StatelessWidget {
  const DrawerLogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        CacheHelper.removeData(key: 'token').then((value) {
          AnimatedDrawerCubit.get(context).closeDrawer();
          Navigator.pushReplacementNamed(context, Routes.loginView);
        });
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            IconBroken.Logout,
            color: Colors.white,
            size: AppConstants.iconSize28,
          ),
          SizedBox(
            width: AppConstants.padding10w,
          ),
          Text(
            'Logout',
            style: AppStyles.textStyle15,
          ),
        ],
      ),
    );
  }
}
