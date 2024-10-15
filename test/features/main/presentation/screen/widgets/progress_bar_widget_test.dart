import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:superlikers/core/core.dart';
import 'package:superlikers/features/main/presentation/screen/widgets/progress_bar_widget.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() {

  const ScreenUtilInit app = ScreenUtilInit(
    designSize: Size(360, 640),
    child: MaterialApp(
      home: Scaffold(
        body: ProgressBarWidget(
          percentage: 40,
          color: AppColors.greenProgressColor,
        ),
      ),
    ),
  );

  testWidgets('render ProgressBarWidget', (WidgetTester tester) async {
    await tester.pumpWidget(app);
    expect(find.text('40%'), findsOneWidget);

    expect(find.byType(SfRadialGauge), findsOneWidget);
    final RangePointer rangePointer =
        tester.widget<RangePointer>(find.byType(RangePointer));
    expect(rangePointer.value, 40);
    expect(rangePointer.gradient!.colors.first, AppColors.greenProgressColor);
  });
}
