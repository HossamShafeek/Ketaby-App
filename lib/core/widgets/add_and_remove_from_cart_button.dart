import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/config/icons/icons_broken.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/widgets/custom_container_button.dart';
import 'package:ketaby/feature/cart/presentation/cubits/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:ketaby/feature/cart/presentation/cubits/get_cart_cubit/get_cart_cubit.dart';
import 'package:ketaby/feature/cart/presentation/cubits/get_cart_cubit/get_cart_state.dart';
import 'package:ketaby/feature/home/data/models/books_model/product.dart';

class AddAndRemoveFromCartButton extends StatelessWidget {
  const AddAndRemoveFromCartButton({Key? key, required this.book})
      : super(key: key);

  final Product book;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetCartCubit, GetCartState>(
      listener: (context, state) {},
      builder: (context, state) {
        return CustomContainerButton(
          onTap: () {
            if (!GetCartCubit.get(context).cartId.contains(book.id)) {
              AddToCartCubit.get(context)
                  .addToCart(bookId: book.id.toString(), context: context)
                  .then((value) {
                GetCartCubit.get(context).cartId.add(book.id!);
                GetCartCubit.get(context).getCart();
              });
            }
          },
          icon: IconBroken.Buy,
          color: GetCartCubit.get(context).cartId.contains(book.id)
              ? AppColors.indigo
              : AppColors.grey,
        );
      },
    );
  }
}
