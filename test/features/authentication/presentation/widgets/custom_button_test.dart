import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:superlikers/features/authentication/presentation/widgets/custom_button.dart';

void main() {
  const ScreenUtilInit app = ScreenUtilInit(
    designSize: Size(360, 640),
    child: MaterialApp(
      home: Scaffold(
        body: CustomButton(
          label: 'label',
        ),
      ),
    ),
  );

  testWidgets('render CustomButton', (WidgetTester tester) async {
    await tester.pumpWidget(app);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}
