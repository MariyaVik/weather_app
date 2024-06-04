import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../auth/cubit/auth_cubit.dart';
import '../../auth/cubit/auth_state.dart';
import '../../location/ui/select_location_page.dart';
import '../../news/ui/news_page.dart';
import '../../profile/profile_page.dart';
import '../../weather/ui/weather_page.dart';
import '../cubit/app_cubit.dart';
import '../cubit/app_state.dart';
import '../data/models/bottom_item.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/selected_item_bottom_nav_bar.dart';

class BasePage extends StatelessWidget {
  BasePage({super.key});

  final List<Widget> pages = [
    const WeatherPage(),
    const NewsPage(),
    const SelectLocationPage(),
    const ProfilePage(),
  ];

  final List<BottomItem> bottomItems = [
    BottomItem(image: 'assets/icons/sun.svg', title: 'Главная'),
    BottomItem(image: 'assets/icons/cloud.svg', title: 'Новости'),
    BottomItem(image: 'assets/icons/location.svg', title: 'Поиск'),
    BottomItem(image: 'assets/icons/lightning.svg', title: 'Профиль'),
  ];

  List<BottomNavigationBarItem> get items => bottomItems
      .map((e) => BottomNavigationBarItem(
            icon: SvgPicture.asset(e.image),
            activeIcon: SelectedItemBottomNavBar(icon: e.image),
            label: e.title,
          ))
      .toList();

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
          items: items,
        ),
      );
    });
  }
}
