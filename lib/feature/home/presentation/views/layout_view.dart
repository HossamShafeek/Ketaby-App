import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/feature/home/presentation/cubits/animated_drawer_cubit/animated_drawer_cubit.dart';
import 'package:ketaby/feature/home/presentation/cubits/animated_drawer_cubit/animated_drawer_state.dart';
import 'package:ketaby/feature/home/presentation/cubits/best_seller_cubit/best_seller_cubit.dart';
import 'package:ketaby/feature/home/presentation/cubits/categories_cubit/categories_cubit.dart';
import 'package:ketaby/feature/home/presentation/cubits/new_arrivals_cubit/new_arrivals_cubit.dart';
import 'package:ketaby/feature/home/presentation/cubits/sliders_cubit/sliders_cubit_cubit.dart';
import 'package:ketaby/feature/home/presentation/views/drawer_view.dart';
import 'package:ketaby/feature/home/presentation/views/home_view.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({Key? key}) : super(key: key);

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  @override
  void initState() {
    SlidersCubit.get(context).getSliders();
    CategoriesCubit.get(context).getCategories();
    BestSellerCubit.get(context).getBestSeller();
    NewArrivalsCubit.get(context).getNewArrivals();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimatedDrawerCubit, AnimatedDrawerState>(
      builder: (context, state) {
        return Scaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: AnimatedDrawerCubit.get(context).isOpenDrawer
                ? AppConstants.systemUiOverlayStyleLight
                : AppConstants.systemUiOverlayStyleDark,
            child: Stack(
              children: [
                const DrawerView(),
                AnimatedContainer(
                  transform: Matrix4.translationValues(
                      AnimatedDrawerCubit.get(context).xOffset2,
                      AnimatedDrawerCubit.get(context).yOffset2,
                      0)
                    ..scale(AnimatedDrawerCubit.get(context).scaleFactor2),
                  duration: const Duration(milliseconds: 500),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(
                          AnimatedDrawerCubit.get(context).isOpenDrawer
                              ? AppConstants.radius20sp
                              : 0.0)),
                ),
                const HomeView(),
              ],
            ),
          ),
        );
      },
    );
  }
}
