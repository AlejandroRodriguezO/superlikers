import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:superlikers/core/core.dart';
import 'package:superlikers/features/features.dart';
import 'package:superlikers/features/main/presentation/screen/widgets/custom_appbar.dart';

class MockAuthenticationCubit extends MockCubit<AuthenticationState>
    implements AuthenticationCubit {}

void main() {
  late MockAuthenticationCubit mockAuthenticationCubit;

  setUp(() {
    mockAuthenticationCubit = MockAuthenticationCubit();
  });

  testWidgets('CustomAppBar displays and interacts correctly',
      (WidgetTester tester) async {
    when(() => mockAuthenticationCubit.signOut()).thenAnswer(
      (_) async => <dynamic, dynamic>{},
    );

    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(360, 640),
        child: BlocProvider<AuthenticationCubit>(
          create: (_) => mockAuthenticationCubit,
          child: InheritedGoRouter(
            goRouter: router,
            child: const MaterialApp(
              home: Scaffold(
                appBar: CustomAppBar(),
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.text('Gerson Joel Camacho'), findsOneWidget);

    final Finder menuButton = find.byIcon(Icons.menu);
    expect(menuButton, findsOneWidget);

    await tester.tap(menuButton);
    await tester.pump();
  });
}
