import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ketaby/config/local/cache_helper.dart';
import 'package:ketaby/config/routes/app_routes.dart';
import 'package:ketaby/config/themes/app_theme.dart';
import 'package:ketaby/core/api/api_services_implementation.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/feature/favourites/data/repository/favourites_repository_implementation.dart';
import 'package:ketaby/feature/favourites/presentation/cubits/add_and_remove_favourites_cubit/add_and_remove_favourites_cubit.dart';
import 'package:ketaby/feature/favourites/presentation/cubits/get_favourites_cubit/get_favourites_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  AppConstants.token = CacheHelper.getString(key: 'token') ?? '';
  runApp(const KetabyApp());
}

class KetabyApp extends StatelessWidget {
  const KetabyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AddAndRemoveFavouritesCubit(
                  FavouritesRepositoryImplementation(
                      ApiServicesImplementation())),
            ),
            BlocProvider(
              create: (context) => GetFavouritesCubit(
                  FavouritesRepositoryImplementation(
                      ApiServicesImplementation()),AddAndRemoveFavouritesCubit(
        FavouritesRepositoryImplementation(
        ApiServicesImplementation())),),
            ),
          ],
          child: MaterialApp(
            title: 'Ketaby',
            debugShowCheckedModeBanner: false,
            theme: appTheme(),
            onGenerateRoute: AppRoutes.generateRoute,
          ),
        );
      },
    );
  }
}
