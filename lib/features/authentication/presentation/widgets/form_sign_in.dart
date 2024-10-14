import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superlikers/core/core.dart';

import '../../authentication.dart';
import 'custom_input.dart';

class FormSignIn extends StatefulWidget {
  const FormSignIn({super.key});

  @override
  State<FormSignIn> createState() => _FormSignInState();
}

class _FormSignInState extends State<FormSignIn> {
  final ValueNotifier<bool> isObscureText = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        CustomInput(
          label: 'Número de usuario *',
          onChanged: context.read<AuthenticationCubit>().onChangedUsername,
          validator: (String? value) {
            if (value != null && value.isEmpty) {
              return 'Este campo es obligatorio';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        ValueListenableBuilder<bool>(
            valueListenable: isObscureText,
            builder: (BuildContext context, bool value, _) {
              return CustomInput(
                label: 'Contraseña *',
                obscureText: value,
                suffix: IconButton(
                  onPressed: () {
                    isObscureText.value = !isObscureText.value;
                  },
                  icon: Icon(
                    !value ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                    color: AppColors.blueLigthColor,
                  ),
                ),
                onChanged:
                    context.read<AuthenticationCubit>().onChangedPassword,
                validator: (String? value) {
                  if (value != null && value.isEmpty) {
                    return 'Este campo es obligatorio';
                  }
                  return null;
                },
              );
            }),
      ],
    );
  }
}
