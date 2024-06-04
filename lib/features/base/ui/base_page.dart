import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/features/auth/cubit/auth_cubit.dart';
import 'package:weather_app/features/auth/cubit/auth_state.dart';

import '../../../common/theme/app_colors.dart';
import '../../location/ui/select_location_page.dart';
import '../../news/ui/news_page.dart';
import '../../profile/profile_page.dart';
import '../../weather/ui/weather_page.dart';
import '../cubit/app_cubit.dart';
import '../cubit/app_state.dart';
import 'widgets/custom_app_bar.dart';

class BasePage extends StatelessWidget {
  BasePage({super.key});

  final List<Widget> pages = [
    const WeatherPage(),
    const NewsPage(),
    const SelectLocationPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(builder: (context, appState) {
      return Scaffold(
        appBar: CustomAppBar(
          user: (context.read<AuthCubit>().state as AuthAuthenticated).user,
        ),
        body: pages[appState.selectedTab],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: appState.selectedTab,
          onTap: (value) {
            context.read<AppCubit>().selectTab(value);
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/sun.svg'),
              activeIcon:
                  const SelectedItemBottomNavBar(icon: 'assets/icons/sun.svg'),
              label: 'Главная',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/cloud.svg'),
              activeIcon: const SelectedItemBottomNavBar(
                  icon: 'assets/icons/cloud.svg'),
              label: 'Новости',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/location.svg'),
              activeIcon: const SelectedItemBottomNavBar(
                  icon: 'assets/icons/location.svg'),
              label: 'Поиск',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/lightning.svg'),
              activeIcon: const SelectedItemBottomNavBar(
                  icon: 'assets/icons/lightning.svg'),
              label: 'Профиль',
            ),
          ],
        ),
      );
    });
  }
}

class SelectedItemBottomNavBar extends StatelessWidget {
  const SelectedItemBottomNavBar({
    super.key,
    required this.icon,
  });

  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      width: 60.w,
      height: 44.h,
      decoration: BoxDecoration(
          color: AppColors.black, borderRadius: BorderRadius.circular(12)),
      child: SvgPicture.asset(
        icon,
        color: AppColors.white,
      ),
    );
  }
}
