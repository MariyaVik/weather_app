// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../common/navigation/route_name.dart';
import '../../../common/ui/widgets/elev_button.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _usernameError;
  String? _passwordError;

  void _login(BuildContext context) {
    setState(() {
      _usernameError = null;
      _passwordError = null;
    });
    if (_formKey.currentState!.validate()) {
      final username = _usernameController.text;
      final password = _passwordController.text;
      context.read<AuthCubit>().login(username, password);
    }
  }

  String? nameValidator(String? value) {
    if (_usernameError != null) return _usernameError;
    if (value == null || value.isEmpty) return 'Обязательное поле';
    return null;
  }

  String? passwordValidator(String? value) {
    if (_passwordError != null) return _passwordError;
    if (value == null || value.isEmpty) return 'Обязательное поле';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 200.h),
                  Text(
                    'Откройте мир вокруг: погода и новости в любом регионе!',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.bold, height: 1.2),
                  ),
                  SizedBox(height: 48.h),
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is AuthAuthenticated) {
                        context.goNamed(RouteName.base);
                      } else if (state is AuthError) {
                        if (state.error
                            .toLowerCase()
                            .contains('пользователя')) {
                          _usernameError = state.error;
                        } else if (state.error
                            .toLowerCase()
                            .contains('пароль')) {
                          _passwordError = state.error;
                        }
                        _formKey.currentState!.validate();
                      }
                    },
                    builder: (context, state) {
                      return Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _usernameController,
                              cursorColor: Theme.of(context).primaryColor,
                              textInputAction: TextInputAction.next,
                              decoration:
                                  const InputDecoration(hintText: 'Логин'),
                              onTapOutside: (event) {
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              validator: nameValidator,
                            ),
                            SizedBox(height: 12.h),
                            TextFormField(
                              controller: _passwordController,
                              cursorColor: Theme.of(context).primaryColor,
                              textInputAction: TextInputAction.done,
                              decoration:
                                  const InputDecoration(hintText: 'Пароль'),
                              obscureText: true,
                              onTapOutside: (event) {
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              onFieldSubmitted: (value) => _login(context),
                              validator: passwordValidator,
                            ),
                            SizedBox(height: 36.h),
                            (state is AuthLoading)
                                ? const CircularProgressIndicator()
                                : ElevButton(
                                    callback: () => _login(context),
                                    child: const Text('Войти'),
                                  ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: 0,
              right: 0,
              child: SvgPicture.asset(
                'assets/images/star.svg',
                color: Theme.of(context).primaryColor,
              )),
        ],
      ),
    );
  }
}
