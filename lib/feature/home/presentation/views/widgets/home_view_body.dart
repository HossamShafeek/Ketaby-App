import 'package:flutter/material.dart';
import 'package:ketaby/feature/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:ketaby/feature/home/presentation/views/widgets/categories_list_view.dart';
import 'package:ketaby/feature/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:ketaby/feature/home/presentation/views/widgets/new_arrivals_grid_view.dart';
import 'package:ketaby/feature/home/presentation/views/widgets/sliders_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAppBar(),
        Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SlidersListView(),
                CategoriesListView(),
                BestSellerListView(),
                NewArrivalsGridView(),
              ],
            ),
          ),
        )
      ],
    );
  }
}


