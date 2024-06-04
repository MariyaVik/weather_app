import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/theme/app_colors.dart';

import '../auth/cubit/auth_cubit.dart';
import '../auth/cubit/auth_state.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              (context.read<AuthCubit>().state as AuthAuthenticated).user.name),
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
    );
  }
}
