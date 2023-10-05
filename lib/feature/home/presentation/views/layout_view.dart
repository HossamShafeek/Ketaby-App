import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/feature/cart/presentation/cubits/get_cart_cubit/get_cart_cubit.dart';
import 'package:ketaby/feature/favourites/presentation/cubits/get_favourites_cubit/get_favourites_cubit.dart';
import 'package:ketaby/feature/home/presentation/cubits/animated_drawer_cubit/animated_drawer_cubit.dart';
import 'package:ketaby/feature/home/presentation/cubits/animated_drawer_cubit/animated_drawer_state.dart';
import 'package:ketaby/feature/home/presentation/cubits/best_seller_cubit/best_seller_cubit.dart';
import 'package:ketaby/feature/home/presentation/cubits/categories_cubit/categories_cubit.dart';
import 'package:ketaby/feature/home/presentation/cubits/new_arrivals_cubit/new_arrivals_cubit.dart';
import 'package:ketaby/feature/home/presentation/cubits/sliders_cubit/sliders_cubit_cubit.dart';
import 'package:ketaby/feature/home/presentation/views/drawer_view.dart';
import 'package:ketaby/feature/home/presentation/views/home_view.dart';
import 'package:ketaby/feature/profile/presentation/cubits/get_user_profile_cubit/get_user_profile_cubit.dart';

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
    GetUserProfileCubit.get(context).getUserProfile();
    GetFavouritesCubit.get(context).getFavourites();
    GetCartCubit.get(context).getCart();
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
