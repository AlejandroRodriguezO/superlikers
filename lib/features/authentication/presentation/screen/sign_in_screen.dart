import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:superlikers/features/authentication/presentation/widgets/custom_input.dart';

import '../../../../core/core.dart';
import '../widgets/custom_button.dart';
import 'cubit/authentication_cubit.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthenticationCubit, AuthenticationState>(
        listenWhen:
            (AuthenticationState previous, AuthenticationState current) =>
                previous.signInState != current.signInState,
        listener: (BuildContext context, AuthenticationState state) {
          if (state.signInState is SignInLoaded) {
            final SnackBar snackBar = SnackBar(
              content: Text((state.signInState as SignInLoaded).message),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            context.goNamed(RoutesEnum.summary.name);
          }
          if (state.signInState is SignInFailed) {
            final SnackBar snackBar = SnackBar(
              content: Text((state.signInState as SignInFailed).message),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 33.0),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/icon.png',
                    height: 150,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    '¡Bienvenido/a Modelo Para Ganar!',
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: AppColors.white,
                        fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Ingresa tus datos:',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomInput(
                    label: 'Número de usuario *',
                    onChanged:
                        context.read<AuthenticationCubit>().onChangedUsername,
                    validator: (String? value) {
                      if (value != null && value.isEmpty) {
                        return 'Este campo es obligatorio';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomInput(
                    label: 'Contraseña *',
                    onChanged:
                        context.read<AuthenticationCubit>().onChangedPassword,
                    validator: (String? value) {
                      if (value != null && value.isEmpty) {
                        return 'Este campo es obligatorio';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomButton(
                    label: 'Iniciar sesión',
                    onTap: context.read<AuthenticationCubit>().signIn,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const CustomButton(
                    label: 'Entrar como supervisor',
                    backgroundColor: Color(0xFF103762),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
