import 'package:flutter/material.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/utils/app_strings.dart';
import 'package:ketaby/core/widgets/custom_back_button.dart';
import 'package:ketaby/core/widgets/user_image.dart';
import 'package:ketaby/feature/favourites/presentation/view/widgets/favourites_view_body.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const Text(AppStrings.favourites),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: AppConstants.defaultPadding),
            child: const UserImage(),
          ),
        ],
      ),
      body: const FavouritesViewBody(),
    );
  }
}
