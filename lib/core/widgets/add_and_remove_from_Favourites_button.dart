import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/config/icons/icons_broken.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/widgets/custom_container_button.dart';
import 'package:ketaby/feature/favourites/presentation/cubits/add_to_favourites_cubit/add_to_favourites_cubit.dart';
import 'package:ketaby/feature/favourites/presentation/cubits/get_favourites_cubit/get_favourites_cubit.dart';
import 'package:ketaby/feature/favourites/presentation/cubits/get_favourites_cubit/get_favourites_state.dart';
import 'package:ketaby/feature/favourites/presentation/cubits/remove_from_favourites_cubit/remove_from_favourites_cubit.dart';
import 'package:ketaby/feature/home/data/models/books_model/product.dart';

class AddAndRemoveFromFavouritesButton extends StatelessWidget {
  const AddAndRemoveFromFavouritesButton({Key? key, required this.book})
      : super(key: key);

  final Product book;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetFavouritesCubit, GetFavouritesState>(
      listener: (context, state) {},
      builder: (context, state) {
        return CustomContainerButton(
          onTap: () {
            if (GetFavouritesCubit.get(context)
                .products
                .contains(book)) {
              RemoveFromFavouritesCubit.get(context)
                  .removeFromFavourites(
                bookId: book.id.toString(),
                context: context,
              )
                  .then((value) {
                GetFavouritesCubit.get(context).getFavourites();
              });
            } else {
              AddToFavouritesCubit.get(context)
                  .addToFavourites(
                bookId: book.id.toString(),
                context: context,
              )
                  .then((value) {
                GetFavouritesCubit.get(context).getFavourites();
              });
            }
          },
          icon: IconBroken.Heart,
          color: GetFavouritesCubit.get(context).products.contains(book)
              ? AppColors.redAccent
              : AppColors.grey,
        );
      },
    );
  }
}
