import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ketaby/config/icons/icons_broken.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_constants.dart';

class DrawerUserPhoto extends StatelessWidget {
  const DrawerUserPhoto({Key? key, required this.imagePath}) : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: AppConstants.radius30sp,
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
          radius: AppConstants.radius28sp,
        ),
      ),
    );
  }
}
