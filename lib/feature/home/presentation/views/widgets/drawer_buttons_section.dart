import 'package:flutter/material.dart';
import 'package:ketaby/config/icons/icons_broken.dart';
import 'package:ketaby/config/routes/app_routes.dart';
import 'package:ketaby/feature/home/presentation/cubits/animated_drawer_cubit/animated_drawer_cubit.dart';
import 'package:ketaby/feature/home/presentation/views/widgets/drawer_buttons_section_item.dart';

class DrawerButtonsSection extends StatelessWidget {
  const DrawerButtonsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DrawerButtonsSectionItem(
          title: 'Home',
          icon: IconBroken.Home,
          onTap: () {
            AnimatedDrawerCubit.get(context).closeDrawer();
          },
        ),
        DrawerButtonsSectionItem(
          title: 'Books',
          icon: IconBroken.Document,
          onTap: () {
            Navigator.pushNamed(context, Routes.booksView);
            AnimatedDrawerCubit.get(context).closeDrawer();
          },
        ),
        DrawerButtonsSectionItem(
          title: 'Favourites',
          icon: IconBroken.Heart,
          onTap: () {
            Navigator.pushNamed(context, Routes.favouritesView);
            AnimatedDrawerCubit.get(context).closeDrawer();
          },
        ),
        DrawerButtonsSectionItem(
          title: 'Cart',
          icon: IconBroken.Buy,
          onTap: () {
            AnimatedDrawerCubit.get(context).closeDrawer();
          },
        ),
        DrawerButtonsSectionItem(
          title: 'Profile',
          icon: IconBroken.Profile,
          onTap: () {
            Navigator.pushNamed(context, Routes.profileView);
            AnimatedDrawerCubit.get(context).closeDrawer();
          },
        ),
      ],
    );
  }
}
