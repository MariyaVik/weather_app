import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:weather_app/features/location/cubit/location_cubit.dart';

import '../cubit/location_state.dart';

class SelectLocationPage extends StatelessWidget {
  const SelectLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 32),
          TextField(
            onSubmitted: (cityName) {
              context.read<LocationCubit>().selectCity(cityName);
            },
            decoration: const InputDecoration(
              hintText: 'Введите название города',
            ),
          ),
          const SizedBox(height: 16),
          BlocBuilder<LocationCubit, LocationState>(builder: (context, state) {
            if (state is Loaded) {
              return Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: FlutterMap(
                    options: MapOptions(
                        initialCenter: LatLng(
                            state.coordinates.lat, state.coordinates.lon)),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName:
                            'dev.fleaflet.flutter_map.example',
                      ),
                    ],
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          }),
        ],
      ),
    );
  }
}
