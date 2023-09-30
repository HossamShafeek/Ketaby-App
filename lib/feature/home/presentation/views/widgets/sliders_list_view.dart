
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/widgets/custom_error_widget.dart';
import 'package:ketaby/core/widgets/custom_network_image.dart';
import 'package:ketaby/core/widgets/loading_indicator_widget.dart';
import 'package:ketaby/feature/home/presentation/cubits/sliders_cubit/sliders_cubit_cubit.dart';

class SlidersListView extends StatelessWidget {
  const SlidersListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SlidersCubit,SlidersState>(builder: (context, state) {
      if(state is SlidersSuccessState){
        return CarouselSlider.builder(
          itemCount: state.slidersModel.data!.sliders!.length,
          itemBuilder: (context, index, s) => InkWell(
            onTap: () {},
            child: CustomNetworkImage(
              image: state.slidersModel.data!.sliders![index].image!,
              backgroundColor: AppColors.grey50,
            ),
          ),
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.7,
            viewportFraction: 0.80,
            autoPlayInterval: const Duration(seconds: 4),
            enlargeCenterPage: true,
          ),
        );
      }else if(state is SlidersFailureState){
        return CustomErrorWidget(error: state.error);
      }else{
        return const   LoadingIndicatorWidget();
      }
    },);
  }
}