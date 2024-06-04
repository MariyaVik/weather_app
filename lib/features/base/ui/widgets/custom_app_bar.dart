import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../auth/data/models/user_model.dart';
import '../../../location/cubit/location_cubit.dart';
import '../../../location/cubit/location_state.dart';
import '../../../location/data/models/location.dart';
import '../../../weather/cubit/weather_cubit.dart';
import 'app_bar_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final UserModel user;

  const CustomAppBar({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              user.imageUrl!,
              width: 40.w,
              height: 40.w,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(width: 20),
          SizedBox(
            height: 40.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBarText(text: user.name),
                BlocConsumer<LocationCubit, LocationState>(
                    listener: (BuildContext context, LocationState state) {
                  if (state is Loaded) {
                    context.read<WeatherCubit>().fetchWeatherByCoordinates(
                        state.coordinates.lat, state.coordinates.lon);
                  }
                }, builder: (context, locationState) {
                  return locationState.when(
                    loading: () {
                      return const AppBarText(text: 'Город не выбран');
                    },
                    loaded: (String selectedCity, Location coordinates) {
                      return AppBarText(text: selectedCity);
                    },
                    cityNotSelected: () {
                      return const AppBarText(text: 'Город не выбран');
                    },
                    error: (String message) {
                      return const AppBarText(text: 'Ошибка получения города');
                    },
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
