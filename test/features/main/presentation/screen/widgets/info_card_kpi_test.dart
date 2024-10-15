import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:superlikers/core/core.dart';
import 'package:superlikers/features/main/presentation/screen/widgets/info_card_kpi.dart';

void main() {
  const ScreenUtilInit app = ScreenUtilInit(
    designSize: Size(360, 640),
    child: MaterialApp(
      home: Scaffold(
        body: InfoCardKpi(),
      ),
    ),
  );

  testWidgets('render InfoCardKpi', (WidgetTester tester) async {
    await tester.pumpWidget(app);
    expect(find.text('Metas por volumen'), findsOneWidget);
    final Text metasText = tester.widget<Text>(find.text('Metas por volumen'));
    expect(metasText.style?.color, Colors.amber);
    expect(metasText.style?.fontSize, 14.sp);
    expect(metasText.style?.fontWeight, FontWeight.bold);

    expect(
        find.text(
            'Estas son las principales metas por volumen que debes cumplir al mes.'),
        findsOneWidget);
    final Text principalesMetasText = tester.widget<Text>(find.text(
        'Estas son las principales metas por volumen que debes cumplir al mes.'));
    expect(principalesMetasText.style?.color, AppColors.white);
    expect(principalesMetasText.style?.fontSize, 12.sp);
    expect(principalesMetasText.style?.fontSize, 12.sp);
    expect(principalesMetasText.style?.fontWeight, FontWeight.bold);

    expect(
        find.text(
            'A medida que avanzas en cada una, vas sumando a porcentaje de cumplimiento total para obtener tu bonificación.'),
        findsOneWidget);
    final Text cumplimientoText = tester.widget<Text>(find.text(
        'A medida que avanzas en cada una, vas sumando a porcentaje de cumplimiento total para obtener tu bonificación.'));
    expect(cumplimientoText.style?.color, AppColors.white);
    expect(cumplimientoText.style?.fontSize, 12.sp);
    expect(cumplimientoText.style?.fontWeight, FontWeight.w200);
    expect(cumplimientoText.style?.fontStyle, FontStyle.italic);
  });
}
