import 'package:flutter/material.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/utils/app_styles.dart';

class DrawerButtonsSectionItem extends StatelessWidget {
  const DrawerButtonsSectionItem({
    Key? key,
    required this.icon,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppConstants.padding20h),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: AppConstants.iconSize22,
              color: Colors.white,
            ),
            SizedBox(
              width: AppConstants.padding10w,
            ),
            Text(
              title,
              style: AppStyles.textStyle15,
            ),
          ],
        ),
      ),
    );
  }
}
