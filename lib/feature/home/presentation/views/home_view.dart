import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/feature/home/presentation/cubits/animated_drawer_cubit/animated_drawer_cubit.dart';
import 'package:ketaby/feature/home/presentation/cubits/animated_drawer_cubit/animated_drawer_state.dart';
import 'package:ketaby/feature/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return BlocBuilder<AnimatedDrawerCubit, AnimatedDrawerState>(
     builder: (context, state) {
       return AnimatedContainer(
         width: MediaQuery.of(context).size.width,
         height: MediaQuery.of(context).size.height,
         clipBehavior: Clip.antiAlias,
         transform: Matrix4.translationValues(
             AnimatedDrawerCubit.get(context).xOffset,
             AnimatedDrawerCubit.get(context).yOffset,
             0)
           ..scale(AnimatedDrawerCubit.get(context).scaleFactor),
         duration: const Duration(milliseconds: 300),
         decoration: BoxDecoration(
           color: Colors.white,
           borderRadius: BorderRadius.circular(
               AnimatedDrawerCubit.get(context).isOpenDrawer ? AppConstants.radius20sp : 0.0),
         ),
         child: const HomeViewBody(),
       );
     },
   );
  }
}