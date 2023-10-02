import 'package:flutter/material.dart';
import 'package:ketaby/config/icons/icons_broken.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/utils/app_styles.dart';
import 'package:ketaby/core/widgets/gradient_button.dart';
import 'package:ketaby/feature/home/data/models/books_model/product.dart';

class BookDetailBottomNavBarAddToCart extends StatelessWidget {
  const BookDetailBottomNavBarAddToCart({Key? key, required this.book})
      : super(key: key);

  final Product book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                '${book.priceAfterDiscount} EPG',
                style: AppStyles.textStyle18.copyWith(
                  color: AppColors.indigo,
                ),
              ),
              Text(
                '${book.price} EPG',
                style: AppStyles.textStyle13.copyWith(
                    //color: AppColors.indigo,
                    ),
              ),
              Text(
                'Price',
                style: AppStyles.textStyle15.copyWith(color: AppColors.black),
              ),
            ],
          ),
          SizedBox(
            width: AppConstants.padding10w,
          ),
          Expanded(
            child: GradientButton(
              onPressed: () {},
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Add to cart',
                      style: AppStyles.textStyle18.copyWith(
                        color: AppColors.white,
                      )),
                  SizedBox(
                    width: AppConstants.padding5w,
                  ),
                  Icon(
                    IconBroken.Buy,
                    color: Colors.white,
                    size: AppConstants.iconSize22,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
