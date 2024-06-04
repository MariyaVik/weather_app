import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/ui/widgets/elev_button.dart';
import '../../../base/cubit/app_cubit.dart';

class CityNotSelectedWidget extends StatelessWidget {
  const CityNotSelectedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Выберите город, чтобы узнать погоду'),
        const SizedBox(
          height: 16,
        ),
        ElevButton(
          child: const Text('Выбрать город'),
          callback: () {
            context.read<AppCubit>().selectTab(2);
          },
        ),
      ],
    );
  }
}
