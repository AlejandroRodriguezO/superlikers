import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:superlikers/features/authentication/authentication.dart';

import '../../../../../core/core.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(25.r),
      ),
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.blueLigthColor,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25.r),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 8, right: 8),
          child: Row(
            children: <Widget>[
              IconButton(
                onPressed: () {
                  context.read<AuthenticationCubit>().signOut();
                  context.goNamed(RoutesEnum.login.name);
                },
                icon: Icon(
                  Icons.menu,
                  size: 30.dg,
                  color: Colors.amber,
                ),
              ),
              FittedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Gerson Joel Camacho',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w300,
                        ),
                        children: const <InlineSpan>[
                          TextSpan(
                            text: 'Cod. Modelo: ',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          TextSpan(
                            text: '102100101',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 10),
                      decoration: BoxDecoration(
                        color: AppColors.dropdownColor,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Row(
                        children: <Widget>[
                          Text.rich(
                            TextSpan(
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w300,
                              ),
                              children: const <InlineSpan>[
                                TextSpan(
                                  text: 'Modelorama: ',
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Nuevo León',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              Image.asset(
                'assets/logo.png',
                height: 40.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 32.h);
}
