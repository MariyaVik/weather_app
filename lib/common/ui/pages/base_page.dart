import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/auth/cubit/auth_cubit.dart';
import 'package:weather_app/features/auth/cubit/auth_state.dart';

import '../../theme/app_colors.dart';

class BasePage extends StatelessWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text((context.read<AuthCubit>().state as AuthAuthenticated)
                .user
                .name),
            TextButton(
                onPressed: () {
                  context.read<AuthCubit>().logout();
                },
                child: const Text(
                  'Выйти',
                  style: TextStyle(color: AppColors.black),
                ))
          ],
        ),
      ),
    );
  }
}
