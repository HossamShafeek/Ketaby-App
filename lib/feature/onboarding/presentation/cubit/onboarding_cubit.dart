import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/feature/onboarding/presentation/cubit/onboarding_state.dart';


class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel(
      {required this.image, required this.title, required this.body});
}


class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitialState());

  static OnBoardingCubit get(context) => BlocProvider.of(context);

  final PageController pageController = PageController();


  List<BoardingModel> boarding = [
  BoardingModel(
  image: 'assets/images/onboard1.png',
  title: 'On Boarding Screen',
  body:
  'Online shopping is a form of electronic commerce which allows consumers to directly buy goods or services from a seller over the Internet using a mobile app.'),
  BoardingModel(
  image: 'assets/images/onboard2.png',
  title: 'On Boarding Screen',
  body:
  'Online shopping is a form of electronic commerce which allows consumers to directly buy goods or services from a seller over the Internet using a mobile app.'),
  BoardingModel(
  image: 'assets/images/onboard3.png',
  title: 'On Boarding Screen',
  body:
  'Online shopping is a form of electronic commerce which allows consumers to directly buy goods or services from a seller over the Internet using a mobile app.'),
  ];

  bool isLast = false;

  void onChangePageView(int index) {
    if (index == boarding.length - 1) {
      isLast = true;
      emit(OnChangePageViewState());
    } else {
      isLast = false;
      emit(OnChangePageViewState());
    }
  }
}
