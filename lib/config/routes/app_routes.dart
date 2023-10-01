import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/animations/page_fade_transition.dart';
import 'package:ketaby/core/animations/page_slide_transition.dart';
import 'package:ketaby/core/api/api_services_implementation.dart';
import 'package:ketaby/core/utils/app_strings.dart';
import 'package:ketaby/feature/authentication/data/repository/authentication_repository_implementation.dart';
import 'package:ketaby/feature/authentication/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:ketaby/feature/authentication/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:ketaby/feature/authentication/presentation/views/login_view.dart';
import 'package:ketaby/feature/authentication/presentation/views/register_view.dart';
import 'package:ketaby/feature/home/data/models/books_model/product.dart';
import 'package:ketaby/feature/home/data/repository/home_repository_implementaion.dart';
import 'package:ketaby/feature/home/presentation/cubits/animated_drawer_cubit/animated_drawer_cubit.dart';
import 'package:ketaby/feature/home/presentation/cubits/best_seller_cubit/best_seller_cubit.dart';
import 'package:ketaby/feature/home/presentation/cubits/books_cubit/books_cubit.dart';
import 'package:ketaby/feature/home/presentation/cubits/categories_cubit/categories_cubit.dart';
import 'package:ketaby/feature/home/presentation/cubits/new_arrivals_cubit/new_arrivals_cubit.dart';
import 'package:ketaby/feature/home/presentation/cubits/sliders_cubit/sliders_cubit_cubit.dart';
import 'package:ketaby/feature/home/presentation/views/book_details_view.dart';
import 'package:ketaby/feature/home/presentation/views/books_view.dart';
import 'package:ketaby/feature/home/presentation/views/layout_view.dart';
import 'package:ketaby/feature/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:ketaby/feature/onboarding/presentation/views/onboarding_view.dart';
import 'package:ketaby/feature/profile/data/repositry/profile_repository_implementation.dart';
import 'package:ketaby/feature/profile/presentation/cubits/get_user_profile_cubit.dart';
import 'package:ketaby/feature/profile/presentation/views/profile_view.dart';
import 'package:ketaby/feature/splash/presentation/views/splash_view.dart';

class Routes {
  static const String slashView = '/';
  static const String onBoardingView = '/onBoarding_view';
  static const String registerView = '/register_view';
  static const String loginView = '/login_view';
  static const String layoutView = '/layout_view';
  static const String searchView = '/search_view';
  static const String booksView = '/books_view';
  static const String bookDetailsView = '/book_details_view';
  static const String profile = '/profile_view';
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.slashView:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );
      case Routes.onBoardingView:
        return PageFadeTransition(
          page: BlocProvider(
              create: (context) => OnBoardingCubit(),
              child: const OnBoardingView()),
        );
      case Routes.loginView:
        return PageFadeTransition(
          page: BlocProvider(
            create: (context) => LoginCubit(
                AuthenticationRepositoryImplementation(
                    ApiServicesImplementation())),
            child: const LoginView(),
          ),
        );
      case Routes.registerView:
        return PageSlideTransition(
          direction: AxisDirection.left,
          page: BlocProvider(
            create: (context) => RegisterCubit(
                AuthenticationRepositoryImplementation(
                    ApiServicesImplementation())),
            child: const RegisterView(),
          ),
        );
      case Routes.booksView:
        return PageSlideTransition(
          direction: AxisDirection.left,
          page: BlocProvider(
            create: (context) => BooksCubit(
                HomeRepositoryImplementation(ApiServicesImplementation())),
            child: const BooksView(),
          ),
        );
        case Routes.bookDetailsView:
          final book = settings.arguments as Product;
        return PageSlideTransition(
          direction: AxisDirection.left,
          page:  BookDetailsView(book: book),
        );
        case Routes.profile:
        return PageSlideTransition(
          direction: AxisDirection.left,
          page: BlocProvider(
            create: (context) => GetUserProfileCubit(
                ProfileRepositoryImplementation(ApiServicesImplementation())),
            child: const ProfileView(),
          ),
        );
      case Routes.layoutView:
        return PageSlideTransition(
          direction: AxisDirection.left,
          page: MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) => AnimatedDrawerCubit(),
            ),
            BlocProvider(
              create: (context) => SlidersCubit(
                  HomeRepositoryImplementation(ApiServicesImplementation())),
            ),
            BlocProvider(
              create: (context) => BestSellerCubit(
                  HomeRepositoryImplementation(ApiServicesImplementation())),
            ),
            BlocProvider(
              create: (context) => CategoriesCubit(
                  HomeRepositoryImplementation(ApiServicesImplementation())),
            ),
            BlocProvider(
              create: (context) => NewArrivalsCubit(
                  HomeRepositoryImplementation(ApiServicesImplementation())),
            ),
          ], child: const LayoutView()),
        );
    }
    return undefinedRoute();
  }

  static Route undefinedRoute() {
    return MaterialPageRoute(
      builder: ((context) => const Scaffold(
            body: Center(
              child: Text(AppStrings.noRouteFound),
            ),
          )),
    );
  }
}
