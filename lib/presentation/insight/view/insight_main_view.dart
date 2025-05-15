import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:trademate_app/presentation/insight/widgets/ai_performance_chart_widget.dart';
import 'package:trademate_app/presentation/insight/widgets/negotiation_stats_widget.dart';
import 'package:trademate_app/theme/palette.dart';

class InsightMainView extends StatefulWidget {
  const InsightMainView({super.key});

  @override
  State<InsightMainView> createState() => _InsightMainViewState();
}

class _InsightMainViewState extends State<InsightMainView> {
  final List<PerformanceData> samplePerformanceData = [
    PerformanceData(label: "Casual", percentage: 0.50),
    PerformanceData(label: "Assertive", percentage: 0.30),
    PerformanceData(label: "Persuasive", percentage: 0.20),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.white,
        elevation: 0,
        title: const Text(
          "Insight",
          style: TextStyle(
            color: Palette.primaryDef,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              TablerIcons.refresh,
              color: Palette.primaryDef,
            ),
            onPressed: () {
              // Refresh action
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // Insight Content Area
            Expanded(
              // Use Expanded to make the content area take available space
              child: SingleChildScrollView(
                // Use SingleChildScrollView for potential scrolling
                padding: const EdgeInsets.all(
                    16.0), // Add padding around the content
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.stretch, // Stretch items horizontally
                  children: <Widget>[
                    // Placeholder for a key statistic
                    NegotiationStatisticsWidget(
                        totalNegotiations: 69, successPercentage: 0.7),
                    const SizedBox(height: 16.0),

                    // Placeholder for a chart or graph
                    AiPerformanceWidget(
                      performanceData: samplePerformanceData,
                    ),
                    const SizedBox(height: 16.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
