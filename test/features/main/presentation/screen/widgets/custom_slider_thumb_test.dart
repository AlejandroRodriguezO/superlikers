import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:superlikers/features/main/presentation/screen/widgets/custom_slider_thumb.dart';

void main() {
  final ScreenUtilInit app = ScreenUtilInit(
    designSize: const Size(360, 640),
    child: MaterialApp(
      home: Scaffold(
        body: SliderTheme(
          data: SliderThemeData(
            thumbShape: CustomSliderThumb(thumbRadius: 20, value: 10),
          ),
          child: Slider(
            value: 10,
            min: 0,
            max: 100,
            onChanged: (double value) {},
          ),
        ),
      ),
    ),
  );

  testWidgets('render CustomSliderThumb', (WidgetTester tester) async {
    await tester.pumpWidget(app);
    expect(find.byType(Slider), findsOneWidget);
  });
}
