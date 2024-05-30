import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/features/auth/cubit/auth_cubit.dart';

import 'navigation/router.dart';
import 'service_locator.dart';
import 'theme/app_theme.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late AuthCubit authCubit;
  late AppRouter appRouter;
  @override
  void initState() {
    super.initState();
    authCubit =
        AuthCubit(authRepository: (ServiceLocator.instance.authRepository));
    appRouter = AppRouter(authCubit);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (_) => authCubit..checkAuthStatus())
      ],
      child: MaterialApp.router(
        title: 'Weather App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().light,
        routerDelegate: appRouter.router.routerDelegate,
        routeInformationParser: appRouter.router.routeInformationParser,
        routeInformationProvider: appRouter.router.routeInformationProvider,
      ),
    );
  }
}
