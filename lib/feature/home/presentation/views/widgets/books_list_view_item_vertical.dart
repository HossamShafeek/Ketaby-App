import 'package:flutter/material.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/utils/app_styles.dart';
import 'package:ketaby/core/widgets/custom_network_image.dart';
import 'package:ketaby/feature/home/data/models/books_model/product.dart';

class BooksListViewItemVertical extends StatelessWidget {
  const BooksListViewItemVertical({Key? key, required this.product, this.width})
      : super(key: key);

  final Product product;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 0,
      decoration: BoxDecoration(
        color: AppColors.grey50,
        borderRadius: BorderRadius.circular(AppConstants.radius10sp),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.grey50,
          borderRadius: BorderRadius.circular(AppConstants.radius10sp),
        ),
        child: Padding(
          padding: EdgeInsets.all(AppConstants.padding8h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: CustomNetworkImage(
                  borderRadius: AppConstants.radius8sp,
                  image: product.image!,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: AppConstants.padding3h),
                child: Text(
                  product.name!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.textStyle16.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: AppConstants.padding3h),
                child: Text(
                  product.category!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.textStyle16.copyWith(
                    color: AppColors.grey,
                  ),
                ),
              ),
              Text(
                'EGP ${product.price!}',
                style: AppStyles.textStyle14.copyWith(
                  color: AppColors.indigo,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
