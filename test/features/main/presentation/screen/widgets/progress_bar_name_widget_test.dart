import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:superlikers/core/core.dart';
import 'package:superlikers/features/main/presentation/screen/widgets/progress_bar_name_widget.dart';
import 'package:superlikers/features/main/presentation/screen/widgets/progress_bar_widget.dart';

void main() {
  const ScreenUtilInit app = ScreenUtilInit(
    designSize: Size(360, 640),
    child: MaterialApp(
      home: Scaffold(
        body: ProgressBarNameWidget(
          percentage: 40,
          name: 'name',
        ),
      ),
    ),
  );

  testWidgets('render ProgressBarNameWidget', (WidgetTester tester) async {
    await tester.pumpWidget(app);
    expect(find.text('name'), findsOneWidget);

    expect(find.byType(ProgressBarWidget), findsOneWidget);

    final ProgressBarWidget progressBar =
        tester.widget<ProgressBarWidget>(find.byType(ProgressBarWidget));
    expect(progressBar.percentage, 40);

    final Text nameText = tester.widget<Text>(find.text('name'));
    expect(nameText.style?.fontSize, 12.sp);
    expect(nameText.style?.color, AppColors.white);
    expect(nameText.style?.fontWeight, FontWeight.w400);
  });
}
