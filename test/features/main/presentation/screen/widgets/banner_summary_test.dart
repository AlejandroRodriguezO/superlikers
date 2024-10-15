import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:superlikers/features/main/presentation/screen/widgets/banner_summary.dart';

void main() {
  const ScreenUtilInit app = ScreenUtilInit(
    designSize: Size(360, 640),
    child: MaterialApp(
      home: Scaffold(body: BannerSummary()),
    ),
  );

  testWidgets('render BannerSummary', (WidgetTester tester) async {
    await tester.pumpWidget(app);
    expect(find.byType(ClipRRect), findsOneWidget);
  });
}
