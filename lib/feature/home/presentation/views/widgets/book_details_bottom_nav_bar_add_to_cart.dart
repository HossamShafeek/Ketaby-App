import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/config/icons/icons_broken.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/utils/app_strings.dart';
import 'package:ketaby/core/utils/app_styles.dart';
import 'package:ketaby/core/widgets/gradient_button.dart';
import 'package:ketaby/feature/cart/presentation/cubits/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:ketaby/feature/cart/presentation/cubits/get_cart_cubit/get_cart_cubit.dart';
import 'package:ketaby/feature/cart/presentation/cubits/get_cart_cubit/get_cart_state.dart';
import 'package:ketaby/feature/home/data/models/books_model/product.dart';

class BookDetailBottomNavBarAddToCart extends StatelessWidget {
  const BookDetailBottomNavBarAddToCart({Key? key, required this.book})
      : super(key: key);

  final Product book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppConstants.defaultPadding),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                '${book.priceAfterDiscount} EGP',
                style: AppStyles.textStyle18.copyWith(
                  color: AppColors.indigo,
                ),
              ),
              Text(
                '${book.price} EGP',
                style: AppStyles.textStyle13.copyWith(
                    //color: AppColors.indigo,
                    ),
              ),
              Text(
                'Price',
                style: AppStyles.textStyle15.copyWith(color: AppColors.black),
              ),
            ],
          ),
          SizedBox(
            width: AppConstants.padding10w,
          ),
          BlocBuilder<GetCartCubit, GetCartState>(
            builder: (context, state) {
              return Expanded(
                child: GradientButton(
                  onPressed: () {
                    if (!GetCartCubit.get(context).cartId.contains(book.id)) {
                      AddToCartCubit.get(context)
                          .addToCart(bookId: book.id.toString(),context: context)
                          .then((value) {
                            GetCartCubit.get(context).cartId.add(book.id!.toInt());
                        GetCartCubit.get(context).getCart();
                      });
                    }
                  },
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          GetCartCubit.get(context).cartId.contains(book.id)
                              ? AppStrings.inCart
                              : AppStrings.addToCart,
                          style: AppStyles.textStyle18.copyWith(
                            color: AppColors.white,
                          )),
                      SizedBox(
                        width: AppConstants.padding5w,
                      ),
                      Icon(
                        IconBroken.Buy,
                        color: Colors.white,
                        size: AppConstants.iconSize22,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
