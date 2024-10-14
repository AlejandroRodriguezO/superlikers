import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../authentication.dart';
import 'custom_button.dart';

class ButtonSubmit extends StatelessWidget {
  const ButtonSubmit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (BuildContext context, AuthenticationState state) {
        return CustomButton(
          label: 'Iniciar sesión',
          onTap: state.isTerms && state.isPrivacy
              ? () {
                  if (Form.of(context).validate()) {
                    context.read<AuthenticationCubit>().signIn();
                  }
                }
              : null,
        );
      },
    );
  }
}
