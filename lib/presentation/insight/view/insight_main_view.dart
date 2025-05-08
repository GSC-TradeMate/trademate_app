import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:trademate_app/theme/palette.dart';

class InsightMainView extends StatefulWidget {
  const InsightMainView({super.key});

  @override
  State<InsightMainView> createState() => _InsightMainViewState();
}

class _InsightMainViewState extends State<InsightMainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // Custom Header for Insight Page
            Container(
              color: Palette.primaryDef,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Insight",
                          style: TextStyle(
                            color: Palette.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            InkWell(
                              child: Icon(
                                TablerIcons.refresh,
                                color: Palette.white,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

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
                    Card(
                      color: Palette.primaryBgStrong,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Messages Sent",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              "1,234", // Replace with actual data
                              style: TextStyle(
                                fontSize: 24.0,
                                color: Palette.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),

                    // Placeholder for a chart or graph
                    Card(
                      color: Palette.primaryBgStrong,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Message Activity Over Time",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            // Placeholder for a chart widget (e.g., from a charting library)
                            Container(
                              decoration: BoxDecoration(
                                color: Palette
                                    .white, // Placeholder color for the chart area
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              height: 200, // Adjust height as needed
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),

                    // Placeholder for another insight section
                    Card(
                      color: Palette.primaryBgStrong,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Most Active Contacts",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            // Placeholder for a list of active contacts
                            Text(
                              "- Contact A (150 messages)\n- Contact B (120 messages)\n- Contact C (100 messages)", // Replace with actual data
                              style: TextStyle(
                                  fontSize: 16.0, color: Palette.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),

                    // Add more insight sections as needed
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
