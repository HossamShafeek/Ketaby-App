import 'package:flutter/material.dart';
import 'package:ketaby/core/utils/app_assets.dart';
import 'package:ketaby/core/utils/app_constants.dart';

class DrawerUserPhoto extends StatelessWidget {
  const DrawerUserPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: AppConstants.radius30sp,
      child: CircleAvatar(
        radius: AppConstants.radius28sp,
        child: Image.asset(
          AppAssets.userImage,
        ),
      ),
    );
  }
}
