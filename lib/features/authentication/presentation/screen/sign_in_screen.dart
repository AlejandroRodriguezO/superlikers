
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../widgets/check_text.dart';
import '../widgets/custom_button.dart';
import '../widgets/form_sign_in.dart';
import '../widgets/submit_button.dart';
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
              child: SingleChildScrollView(
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
                    const FormSignIn(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: Text(
                          '¿Olvidaste tu contraseña?',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.greenColor,
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                    BlocBuilder<AuthenticationCubit, AuthenticationState>(
                      builder:
                          (BuildContext context, AuthenticationState state) {
                        return CheckText(
                          value: state.isTerms,
                          text1: 'He leído y',
                          text2: 'acepto',
                          text3: 'Términos y Condiciones',
                          onChanged: (bool? value) => context
                              .read<AuthenticationCubit>()
                              .onChangedTerms(value!),
                        );
                      },
                    ),
                    BlocBuilder<AuthenticationCubit, AuthenticationState>(
                      builder:
                          (BuildContext context, AuthenticationState state) {
                        return CheckText(
                          value: state.isPrivacy,
                          text1: 'He leído y',
                          text2: 'acepto el',
                          text3: 'Aviso de privacidad',
                          onChanged: (bool? value) => context
                              .read<AuthenticationCubit>()
                              .onChangedPrivacy(value!),
                        );
                      },
                    ),
                    const ButtonSubmit(),
                    SizedBox(
                      height: 10.h,
                    ),
                    const CustomButton(
                      label: 'Entrar como supervisor',
                      backgroundColor: Color(0xFF103762),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            '¿Necesitas ayuda con tu registro?',
                            style: TextStyle(
                              color: AppColors.greenColor,
                              fontStyle: FontStyle.italic,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Image.asset(
                            'assets/whatsapp.png',
                            color: Colors.green,
                            width: 10.w,
                            height: 10.h,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
