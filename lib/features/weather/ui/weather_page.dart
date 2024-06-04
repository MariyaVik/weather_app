import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/common/theme/app_colors.dart';
import 'package:weather_app/common/utils/extensions.dart';

import '../../../common/theme/app_text_style.dart';
import '../../location/cubit/location_cubit.dart';
import '../../location/cubit/location_state.dart';
import '../../location/data/models/location.dart';
import '../cubit/weather_cubit.dart';
import '../cubit/weather_state.dart';
import 'widgets/city_not_selected.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocConsumer<LocationCubit, LocationState>(
            listener: (BuildContext context, LocationState state) {
              if (state is Loaded) {
                context.read<WeatherCubit>().fetchWeatherByCoordinates(
                    state.coordinates.lat, state.coordinates.lon);
              }
            },
            builder: (context, locationState) {
              return locationState.when(
                loaded: (String selectedCity, Location coordinates) {
                  return BlocBuilder<WeatherCubit, WeatherState>(
                    builder: (context, weatherState) {
                      return weatherState.when(
                        initial: () => const CityNotSelectedWidget(),
                        loading: () =>
                            const Center(child: CircularProgressIndicator()),
                        loaded: (weather) => Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // Text(weather.shortWeather.first.description
                            //     .capitalize()),
                            Container(
                              alignment: Alignment.center,
                              width: 260.w,
                              height: 260.h,
                              decoration: const BoxDecoration(
                                  color: AppColors.black,
                                  shape: BoxShape.circle),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '${weather.mainWeather.temp.toStringAsFixed(1)}°C',
                                    style: Poppins().size24Weihtg500.copyWith(
                                        color: AppColors.white, fontSize: 40),
                                  ),
                                  Text(
                                    weather.shortWeather.first.description
                                        .capitalize(),
                                    style: Poppins()
                                        .size14Weihtg400
                                        .copyWith(color: AppColors.white),
                                  ),
                                ],
                              ),
                            ),
                            // Text(weather.shortWeather.first.main),
                          ],
                        ),
                        error: (message) => Text('Error: $message'),
                      );
                    },
                  );
                },
                cityNotSelected: () => const CityNotSelectedWidget(),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (String message) => Text('Error: $message'),
              );
            },
          ),
        ),
      ),
    );
  }
}
