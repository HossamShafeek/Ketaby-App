import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/utils/app_assets.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/utils/app_strings.dart';
import 'package:ketaby/core/widgets/custom_empty_widget.dart';
import 'package:ketaby/feature/favourites/presentation/cubits/get_favourites_cubit/get_favourites_cubit.dart';
import 'package:ketaby/feature/favourites/presentation/cubits/get_favourites_cubit/get_favourites_state.dart';
import 'package:ketaby/feature/home/presentation/views/widgets/books_list_view_item_horizontal.dart';

class FavouritesViewBody extends StatelessWidget {
  const FavouritesViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFavouritesCubit, GetFavouritesState>(
      builder: (context, state) {
        GetFavouritesCubit cubit = GetFavouritesCubit.get(context);
        if (GetFavouritesCubit.get(context).products.isNotEmpty) {
          return ListView.separated(
            padding: EdgeInsets.all(AppConstants.defaultPadding),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return BooksListViewItemHorizontal(book: cubit.products[index]);
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: AppConstants.padding10h,
              );
            },
            itemCount: cubit.products.length,
          );
        } else {
          return CustomEmptyWidget(
            imagePath: AppAssets.noDataImage,
            message: AppStrings.favouritesAreEmpty,
          );
        }
      },
    );
  }
}
