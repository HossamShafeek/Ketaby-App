import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/utils/app_strings.dart';
import 'package:ketaby/core/utils/app_styles.dart';
import 'package:ketaby/core/widgets/custom_error_widget.dart';
import 'package:ketaby/core/widgets/custom_text_button.dart';
import 'package:ketaby/core/widgets/loading_indicator_widget.dart';
import 'package:ketaby/feature/home/presentation/cubits/best_seller_cubit/best_seller_cubit.dart';
import 'package:ketaby/feature/home/presentation/cubits/best_seller_cubit/best_seller_state.dart';
import 'package:ketaby/feature/home/presentation/views/widgets/books_list_view_item_vertical.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestSellerCubit, BestSellerState>(
      builder: (context, state) {
        if (state is BestSellerSuccessState) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppConstants.defaultPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.bestSeller,
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
                SizedBox(
                  height: 180.h,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return BooksListViewItemVertical(
                        book: state.bestSellerModel.data!.products![index],
                        width: 130.w,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: AppConstants.padding10w,
                      );
                    },
                    itemCount: state.bestSellerModel.data!.products!.length,
                  ),
                ),
              ],
            ),
          );
        } else if (state is BestSellerFailureState) {
          return CustomErrorWidget(error: state.error);
        } else {
          return const LoadingIndicatorWidget();
        }
      },
    );
  }
}
