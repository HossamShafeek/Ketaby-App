import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/utils/app_strings.dart';
import 'package:ketaby/core/utils/app_styles.dart';
import 'package:ketaby/core/widgets/custom_text_button.dart';
import 'package:ketaby/feature/home/presentation/cubits/new_arrivals_cubit/new_arrivals_cubit.dart';
import 'package:ketaby/feature/home/presentation/cubits/new_arrivals_cubit/new_arrivals_state.dart';
import 'package:ketaby/feature/home/presentation/views/widgets/books_list_view_item_vertical.dart';

class NewArrivalsGridView extends StatelessWidget {
  const NewArrivalsGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewArrivalsCubit, NewArrivalsState>(
      builder: (context, state) {
        if (state is NewArrivalsSuccessState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.defaultPadding,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.newArrivals,
                      style: AppStyles.textStyle18.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CustomTextButton(
                      title: AppStrings.viewAll,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              StaggeredGridView.countBuilder(
                padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.defaultPadding,
                ),
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisSpacing: AppConstants.padding10w,
                mainAxisSpacing: AppConstants.padding10w,
                itemCount: state.bestSellerModel.data!.products!.length,
                staggeredTileBuilder: (index) {
                  return StaggeredTile.count(1, index.isEven ? 1.2 : 1);
                },
                itemBuilder: (context, index) => BooksListViewItemVertical(
                  product: state.bestSellerModel.data!.products![index],
                ),
              ),
            ],
          );
        } else if (state is NewArrivalsFailureState) {
          return Center(
            child: Text(state.error, textAlign: TextAlign.center),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
