import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/utils/app_strings.dart';
import 'package:ketaby/core/utils/app_styles.dart';
import 'package:ketaby/core/widgets/custom_error_widget.dart';
import 'package:ketaby/core/widgets/loading_indicator_widget.dart';
import 'package:ketaby/feature/home/presentation/cubits/categories_cubit/categories_cubit.dart';
import 'package:ketaby/feature/home/presentation/cubits/categories_cubit/categories_state.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesSuccessState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: AppConstants.padding10h,
                ),
                child: Text(
                  AppStrings.categories,
                  style: AppStyles.textStyle18.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children:
                      state.categoriesModel.data!.categories!.map((category) {
                    return Container(
                      padding: EdgeInsets.all(AppConstants.padding10h),
                      margin: EdgeInsets.only(
                        right: AppConstants.padding10w,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.grey50,
                        borderRadius:
                            BorderRadius.circular(AppConstants.radius8sp),
                      ),
                      child: Text(
                        category.name!,
                        style: AppStyles.textStyle16,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          );
        } else if (state is CategoriesFailureState) {
          return CustomErrorWidget(error: state.error);
        } else {
          return const LoadingIndicatorWidget();
        }
      },
    );
  }
}
