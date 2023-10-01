import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ketaby/config/icons/icons_broken.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/utils/app_styles.dart';
import 'package:ketaby/core/widgets/custom_container_button.dart';
import 'package:ketaby/core/widgets/custom_network_image.dart';
import 'package:ketaby/feature/home/data/models/books_model/product.dart';

class BooksListViewItemHorizontal extends StatelessWidget {
  const BooksListViewItemHorizontal({Key? key, required this.book})
      : super(key: key);

  final Product book;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.pushNamed(context, Routes.bookDetailsView,
        //     arguments: book);
      },
      child: Container(
        padding: EdgeInsets.all(AppConstants.padding10h),
        width: double.infinity,
        height: 95.h,
        decoration: BoxDecoration(
          color: AppColors.grey50,
          borderRadius: BorderRadius.circular(AppConstants.radius10sp),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: CustomNetworkImage(
                borderRadius: AppConstants.radius8sp,
                image: book.image!,
              ),
            ),
            Expanded(
              flex: 7,
              child: Padding(
                padding: EdgeInsets.only(
                  left: AppConstants.padding10w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            book.name!,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: AppStyles.textStyle18.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        CustomContainerButton(
                          onTap: (){},
                          icon: IconBroken.Buy,
                          color: AppColors.indigo,
                        ),
                      ],
                    ),
                    Text(
                      book.category!,
                      style:
                          AppStyles.textStyle15.copyWith(color: AppColors.grey),
                    ),
                    Row(
                      children: [
                        Text(
                          'EGP ${book.priceAfterDiscount}  ',
                          style: AppStyles.textStyle14.copyWith(
                            color: AppColors.indigo,
                          ),
                        ),
                        Text(
                          'EGP ${book.price}',
                          style: AppStyles.textStyle13,
                        ),
                        const Spacer(),
                        CustomContainerButton(
                          onTap: (){},
                          icon: IconBroken.Heart,
                          color: AppColors.redAccent,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}