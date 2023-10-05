import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/utils/app_assets.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/utils/app_strings.dart';
import 'package:ketaby/core/widgets/custom_empty_widget.dart';
import 'package:ketaby/feature/cart/data/models/cart_model/cart_model.dart';
import 'package:ketaby/feature/cart/presentation/cubits/get_cart_cubit/get_cart_cubit.dart';
import 'package:ketaby/feature/cart/presentation/cubits/get_cart_cubit/get_cart_state.dart';
import 'package:ketaby/feature/cart/presentation/views/widgets/cart_list_view_item.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCartCubit,GetCartState>(builder: (context, state) {
      CartModel? cartModel = GetCartCubit.get(context).cartModel;
      if(cartModel!.data!.cartItems!.isNotEmpty){
        return  ListView.separated(
          padding: EdgeInsets.all(AppConstants.defaultPadding),
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return CartListViewItem(book: cartModel.data!.cartItems![index]);
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: AppConstants.padding10h,);
          },
          itemCount: cartModel.data!.cartItems!.length,
        );
      }else{
        return CustomEmptyWidget(
          imagePath: AppAssets.cartImage,
          message: AppStrings.cartIsEmpty,
        );
      }
    },);
  }
}
