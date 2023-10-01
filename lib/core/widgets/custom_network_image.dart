import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ketaby/config/icons/icons_broken.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_constants.dart';

class CustomNetworkImage extends StatelessWidget {
  final double? borderRadius;
  final String image;
  final Color? backgroundColor;

  const CustomNetworkImage(
      {Key? key, this.borderRadius, required this.image, this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(borderRadius ?? AppConstants.radius10sp),
        color: backgroundColor ?? AppColors.white,
      ),
      child: CachedNetworkImage(
        imageUrl: image,
        fit: BoxFit.cover,
        height: double.infinity,
        errorWidget: (context, url, error) => Icon(
          IconBroken.Info_Square,
          color: AppColors.indigo,
          size: AppConstants.iconSize24,
        ),
      ),
    );
  }
}
