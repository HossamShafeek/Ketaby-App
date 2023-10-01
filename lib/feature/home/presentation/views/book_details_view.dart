import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ketaby/config/icons/icons_broken.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/feature/home/data/models/books_model/product.dart';
import 'package:ketaby/feature/home/presentation/views/widgets/book_details_bottom_nav_bar.dart';
import 'package:ketaby/feature/home/presentation/views/widgets/book_details_view_body.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({Key? key, required this.book}) : super(key: key);

  final Product book;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          statusBarColor: AppColors.black.withOpacity(0.4),
          statusBarIconBrightness: Brightness.light),
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.deepPurple,
        body: BookDetailsViewBody(
          book: book,
        ),
        bottomNavigationBar: BookDetailBottomNavBar(
          book: book,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppColors.white,
          child: Icon(
            IconBroken.Heart,
            color: AppColors.redAccent,
            size: AppConstants.iconSize22,
          ),
        ),
      ),
    );
  }
}