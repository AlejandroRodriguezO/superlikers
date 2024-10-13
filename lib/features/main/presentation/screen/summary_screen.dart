import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../features.dart';
import 'widgets/banner_summary.dart';
import 'widgets/card_kpi_widget.dart';
import 'widgets/segmented_control_widget.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({super.key});

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  List<KpiEntity> allKpis = <KpiEntity>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 12.h,
          ),
          const BannerSummary(),
          SizedBox(
            height: 10.h,
          ),
          const SegmentedControlWidget(),
          BlocBuilder<SummaryCubit, SummaryState>(
            builder: (BuildContext context, SummaryState state) {
              return switch (state.entriesState) {
                final EntriesLoaded data =>
                  Builder(builder: (BuildContext context) {
                    return SingleChildScrollView(
                      child: CardKpiWidget(data: data.entries.first.data),
                    );
                  }),
                final EntriesFailed error => Text(error.message),
                _ => const CircularProgressIndicator.adaptive()
              };
            },
          ),
        ],
      ),
    );
  }
}
