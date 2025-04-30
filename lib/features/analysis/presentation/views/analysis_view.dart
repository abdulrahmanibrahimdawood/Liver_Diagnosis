import 'package:e_commerce/features/analysis/presentation/views/widgets/analysis_view_body.dart';
import 'package:flutter/material.dart';

class AnalysisView extends StatelessWidget {
  const AnalysisView({super.key});
  static const routeName = 'analysis';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: AnalysisViewBody(),
      ),
    );
  }
}
