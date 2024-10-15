import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:superlikers/features/main/presentation/screen/widgets/segmented_control_widget.dart';

void main() {
  const ScreenUtilInit app = ScreenUtilInit(
    designSize: Size(600, 640),
    child: MaterialApp(
      home: Scaffold(
        body: SegmentedControlWidget(),
      ),
    ),
  );

  testWidgets('render SegmentedControlWidget', (WidgetTester tester) async {
    await tester.pumpWidget(app);
    final Finder resumenFinder = find.text('Resumen');
    expect(resumenFinder, findsOneWidget);

    expect(find.text('Autoejecución'), findsOneWidget);

    expect(find.text('Radiografia'), findsOneWidget);

    final Text autoejecucionText =
        tester.widget<Text>(find.text('Autoejecución'));
    expect(autoejecucionText.style?.color, Colors.grey);

    final Text radiografiaText = tester.widget<Text>(find.text('Radiografia'));
    expect(radiografiaText.style?.color, Colors.grey);
  });
}
