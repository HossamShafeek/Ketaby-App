import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/utils/app_strings.dart';
import 'package:ketaby/core/utils/app_styles.dart';
import 'package:ketaby/core/widgets/gradient_button.dart';
import 'package:ketaby/feature/cart/data/models/cart_model/cart_model.dart';
import 'package:ketaby/feature/cart/presentation/cubits/get_cart_cubit/get_cart_cubit.dart';
import 'package:ketaby/feature/cart/presentation/cubits/get_cart_cubit/get_cart_state.dart';

class CartCheckOutSection extends StatelessWidget {
  const CartCheckOutSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCartCubit, GetCartState>(
      builder: (context, state) {
        CartModel? cartModel = GetCartCubit.get(context).cartModel;
        return SizedBox(
          height: 100.h,
          child: Padding(
            padding: EdgeInsets.all(AppConstants.defaultPadding),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Price:',
                      style: AppStyles.textStyle18,
                    ),
                    Text(
                      '${cartModel!.data!.total!} EGP',
                      style: AppStyles.textStyle18.copyWith(
                        color: AppColors.indigo,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppConstants.padding10h,
                ),
                GradientButton(
                  onPressed: () {},
                  title: Text(
                    AppStrings.checkout,
                    style: AppStyles.textStyle18.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
