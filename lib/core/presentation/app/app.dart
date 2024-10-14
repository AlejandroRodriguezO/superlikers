import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:superlikers/features/features.dart';

import '../../core.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with RouterMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationCubit>(
      create: (_) => locator<AuthenticationCubit>(),
      child: GestureDetector(
        onTap:()=> FocusManager.instance.primaryFocus?.unfocus(),
        child: ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            builder: (_, Widget? child) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                title: 'Superlikers',
                routerConfig: router,
                theme: ThemeData(
                  scaffoldBackgroundColor: AppColors.scaffoldColor,
                ),
              );
            }),
      ),
    );
  }
}
