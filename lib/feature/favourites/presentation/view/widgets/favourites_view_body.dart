import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/widgets/custom_error_widget.dart';
import 'package:ketaby/core/widgets/loading_indicator_widget.dart';
import 'package:ketaby/feature/favourites/presentation/cubits/get_favourites_cubit/get_favourites_cubit.dart';
import 'package:ketaby/feature/favourites/presentation/cubits/get_favourites_cubit/get_favourites_state.dart';
import 'package:ketaby/feature/home/presentation/views/widgets/books_list_view_item_horizontal.dart';

class FavouritesViewBody extends StatelessWidget {
  const FavouritesViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFavouritesCubit, GetFavouritesState>(
      builder: (context, state) {
        if (state is GetFavouritesSuccessState) {
          return ListView.separated(
            padding: EdgeInsets.all(AppConstants.defaultPadding),
            itemBuilder: (context, index) {
              return BooksListViewItemHorizontal(book: state.prudutes[index],index: index,);
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: AppConstants.padding10h,
              );
            },
            itemCount: state.prudutes.length,
          );
        } else if (state is GetFavouritesFailureState) {
          return CustomErrorWidget(error: state.error);
        } else {
          return const LoadingIndicatorWidget(
            color: AppColors.deepPurple,
          );
        }
      },
    );
  }
}
