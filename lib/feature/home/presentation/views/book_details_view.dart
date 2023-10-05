import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/config/icons/icons_broken.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/feature/favourites/presentation/cubits/add_to_favourites_cubit/add_to_favourites_cubit.dart';
import 'package:ketaby/feature/favourites/presentation/cubits/get_favourites_cubit/get_favourites_cubit.dart';
import 'package:ketaby/feature/favourites/presentation/cubits/get_favourites_cubit/get_favourites_state.dart';
import 'package:ketaby/feature/favourites/presentation/cubits/remove_from_favourites_cubit/remove_from_favourites_cubit.dart';
import 'package:ketaby/feature/home/data/models/books_model/product.dart';
import 'package:ketaby/feature/home/presentation/views/widgets/book_details_bottom_nav_bar.dart';
import 'package:ketaby/feature/home/presentation/views/widgets/book_details_view_body.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({Key? key, required this.book}) : super(key: key);

  final Product book;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          statusBarColor: AppColors.black.withOpacity(0.4),
          statusBarIconBrightness: Brightness.light),
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.deepPurple,
        body: BookDetailsViewBody(
          book: book,
        ),
        bottomNavigationBar: BookDetailBottomNavBar(
          book: book,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: BlocConsumer<GetFavouritesCubit,GetFavouritesState>(
          listener: (context, state) {

          },
          builder: (context, state) {
            return FloatingActionButton(
              onPressed: () {
                if (GetFavouritesCubit.get(context)
                    .products
                    .contains(book)) {
                  RemoveFromFavouritesCubit.get(context)
                      .removeFromFavourites(
                    bookId: book.id.toString(),
                    context: context,
                  ).then((value){
                    GetFavouritesCubit.get(context).getFavourites();
                  });
                } else {
                  AddToFavouritesCubit.get(context)
                      .addToFavourites(
                    bookId: book.id.toString(),
                    context: context,
                  ).then((value) {
                    GetFavouritesCubit.get(context).getFavourites();
                  });

                }
              },
              backgroundColor: AppColors.white,
              child: Icon(
                IconBroken.Heart,
                color: GetFavouritesCubit
                    .get(context)
                    .products
                    .contains(book) ? AppColors.redAccent :AppColors.grey,
                size: AppConstants.iconSize22,
              ),
            );
          },
        ),
      ),
    );
  }
}
