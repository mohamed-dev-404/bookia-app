import 'package:bookia/core/utils/assets/app_icons.dart';
import 'package:bookia/core/utils/colors/app_colors.dart';
import 'package:bookia/core/widgets/custom_svg_picture.dart';
import 'package:bookia/features/home/presentation/view/home_view.dart';
import 'package:flutter/material.dart';

class MainAppView extends StatefulWidget {
  const MainAppView({super.key});

  @override
  State<MainAppView> createState() => _MainAppViewState();
}

class _MainAppViewState extends State<MainAppView> {
  int currentIndex = 0;

  List<Widget> screens = [
    // BlocProvider(
    //   create: (context) => HomeCubit()..loadInitData(),
    //   child: HomeScreen(),
    // ),
    const HomeView(),
    const HomeView(),
    const HomeView(),
    const HomeView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items: const [
            BottomNavigationBarItem(
              icon: CustomSvgPicture(path: AppIcons.homeSvg),
              activeIcon: CustomSvgPicture(
                path: AppIcons.homeSvg,
                color: AppColors.primaryColor,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: CustomSvgPicture(path: AppIcons.bookmarkSvg),
              activeIcon: CustomSvgPicture(
                path: AppIcons.bookmarkSvg,
                color: AppColors.primaryColor,
              ),
              label: 'Wishlist',
            ),
            BottomNavigationBarItem(
              icon: CustomSvgPicture(path: AppIcons.cartSvg),
              activeIcon: CustomSvgPicture(
                path: AppIcons.cartSvg,
                color: AppColors.primaryColor,
              ),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: CustomSvgPicture(path: AppIcons.profileSvg),
              activeIcon: CustomSvgPicture(
                path: AppIcons.profileSvg,
                color: AppColors.primaryColor,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
