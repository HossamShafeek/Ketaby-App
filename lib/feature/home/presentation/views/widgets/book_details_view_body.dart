import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ketaby/config/icons/icons_broken.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/widgets/custom_network_image.dart';
import 'package:ketaby/feature/home/data/models/books_model/product.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({Key? key, required this.book}) : super(key: key);

  final Product book;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: Stack(
        children: [
          CustomNetworkImage(
            borderRadius: 0,
            image: book.image!,
          ),
          Padding(
            padding: EdgeInsets.only(left: AppConstants.padding15h, top: 33.h),
            child: CircleAvatar(
              backgroundColor: Colors.black.withOpacity(0.25),
              radius: AppConstants.radius20sp,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  IconBroken.Arrow___Left_2,
                  color: Colors.white,
                  size: AppConstants.iconSize23,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
