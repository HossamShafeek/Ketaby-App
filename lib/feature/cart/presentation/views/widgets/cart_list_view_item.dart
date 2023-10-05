import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ketaby/config/icons/icons_broken.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/utils/app_styles.dart';
import 'package:ketaby/core/widgets/custom_container_button.dart';
import 'package:ketaby/core/widgets/custom_network_image.dart';
import 'package:ketaby/feature/cart/data/models/cart_model/cart_item.dart';
import 'package:ketaby/feature/cart/presentation/cubits/get_cart_cubit/get_cart_cubit.dart';
import 'package:ketaby/feature/cart/presentation/cubits/remove_from_cart_cubit/remove_from_cart_cubit.dart';
import 'package:ketaby/feature/cart/presentation/cubits/update_cart_cubit/update_cart_cubit.dart';

class CartListViewItem extends StatelessWidget {
  const CartListViewItem({Key? key, required this.book}) : super(key: key);

  final CartItem book;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              image: book.itemProductImage!,
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
                          book.itemProductName!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: AppStyles.textStyle18.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      CustomContainerButton(
                        onTap: () {
                          RemoveFromCartCubit.get(context)
                              .removeFromCart(bookId: book.itemId.toString(),context: context).then((value) {
                                GetCartCubit.get(context).cartId.remove(book.itemProductId);
                                GetCartCubit.get(context).getCart();
                          });
                        },
                        icon: IconBroken.Delete,
                        color: AppColors.redAccent,
                      ),
                    ],
                  ),
                  Text(
                    '${book.itemProductPrice!} EPG',
                    style: AppStyles.textStyle14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${book.itemProductPriceAfterDiscount!} EPG',
                        style: AppStyles.textStyle14.copyWith(
                          color: AppColors.indigo,
                        ),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              if (book.itemQuantity != 1) {
                                UpdateCartCubit.get(context)
                                    .updateCart(
                                  bookId: book.itemId.toString(),
                                  quantity: (book.itemQuantity! - 1).toString(),
                                )
                                    .then((value) {
                                  GetCartCubit.get(context).getCart();
                                });
                              }
                            },
                            child: Icon(
                              Icons.remove,
                              size: AppConstants.iconSize24,
                              color: AppColors.redAccent,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppConstants.padding10w,
                            ),
                            child: Text(
                              book.itemQuantity.toString(),
                              style: AppStyles.textStyle16.copyWith(
                                color: AppColors.indigo,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              UpdateCartCubit.get(context)
                                  .updateCart(
                                bookId: book.itemId.toString(),
                                quantity: (book.itemQuantity! + 1).toString(),
                              )
                                  .then((value) {
                                GetCartCubit.get(context).getCart();
                              });
                            },
                            child: Icon(
                              Icons.add,
                              size: AppConstants.iconSize24,
                              color: AppColors.indigo,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
