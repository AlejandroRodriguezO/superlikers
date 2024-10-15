import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:superlikers/features/authentication/presentation/widgets/check_text.dart';

void main() {
  const ScreenUtilInit app = ScreenUtilInit(
    designSize: Size(360, 640),
    child: MaterialApp(
      home: Scaffold(
        body: CheckText(
          value: true,
          text1: 'text1',
          text2: 'text2',
          text3: 'text3',
        ),
      ),
    ),
  );

  testWidgets('render CheckText', (WidgetTester tester) async {
    await tester.pumpWidget(app);
    expect(find.byType(Checkbox), findsOneWidget);
    expect(find.byType(Text), findsOneWidget);
  });
}
