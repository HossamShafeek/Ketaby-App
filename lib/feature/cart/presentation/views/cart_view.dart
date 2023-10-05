import 'package:flutter/material.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/utils/app_strings.dart';
import 'package:ketaby/core/widgets/custom_back_button.dart';
import 'package:ketaby/core/widgets/user_image.dart';
import 'package:ketaby/feature/cart/presentation/views/widgets/cart_check_out_section.dart';
import 'package:ketaby/feature/cart/presentation/views/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const Text(AppStrings.cart),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: AppConstants.defaultPadding),
            child: const UserImage(),
          ),
        ],
      ),
      body: const CartViewBody(),
      bottomNavigationBar: const CartCheckOutSection(),
    );
  }
}
