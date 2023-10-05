import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ketaby/config/icons/icons_broken.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_constants.dart';

class ImageUserProfile extends StatelessWidget {
  const ImageUserProfile({Key? key, required this.imagePath}) : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        radius: 76.sp,
        backgroundColor: AppColors.indigo,
        child: CircleAvatar(
          radius: 72.sp,
          backgroundColor: Colors.white,
          child: CachedNetworkImage(
            imageUrl: imagePath,
            fit: BoxFit.cover,
            height: double.infinity,
            errorWidget: (context, url, error) => Icon(
              IconBroken.Info_Square,
              color: AppColors.indigo,
              size: AppConstants.iconSize24,
            ),
            imageBuilder: (context, imageProvider) => CircleAvatar(
              backgroundImage: imageProvider,
              radius: 68.sp,
            ),
          ),
        ),
      ),
    );
  }
}
