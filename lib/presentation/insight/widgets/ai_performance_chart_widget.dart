import 'package:flutter/material.dart';
import 'package:trademate_app/theme/palette.dart';

class AiPerformanceWidget extends StatelessWidget {
  // Define a class to hold performance data
  final List<PerformanceData> performanceData;

  const AiPerformanceWidget({
    Key? key,
    required this.performanceData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Palette.white,
      elevation: 2.0, // Add some elevation
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0), // Rounded corners
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Inner padding
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align content to the start
          children: [
            // Header Row (Title and See details)
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Space out title and link
              children: [
                const Text(
                  "AI Performance", // Section Title
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  // Make "See details" tappable
                  onTap: () {
                    // Handle "See details" tap
                    print("See details tapped");
                    // You might navigate to a detailed performance page here
                  },
                  child: Row(
                    children: [
                      Text(
                        "See details",
                        style: TextStyle(
                          color: Palette.primaryDef, // Use theme color for link
                          fontSize: 14.0,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 14.0,
                        color: Palette.primaryDef,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
                height: 16.0), // Spacing between header and performance list

            // Performance List
            Column(
              children: performanceData.map((data) {
                return _buildPerformanceRow(
                    data.label, data.percentage, context);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget to build a performance row with a progress bar
  Widget _buildPerformanceRow(
      String label, double percentage, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 4.0), // Vertical spacing between rows
      child: Row(
        children: [
          Expanded(
            flex: 2, // Allocate more space for the label
            child: Text(
              label,
              style: TextStyle(fontSize: 16.0, color: Palette.black),
            ),
          ),
          const SizedBox(width: 8.0), // Spacing between label and progress bar
          Expanded(
            flex: 3, // Allocate space for the progress bar
            child: LinearProgressIndicator(
              value: percentage,
              backgroundColor:
                  Palette.primaryBgWeak, // Background color of the progress bar
              color: Palette.primaryDef,
              minHeight: 8.0, // Adjust height of the progress bar
              borderRadius: BorderRadius.circular(
                  4.0), // Rounded ends for the progress bar
            ),
          ),
          const SizedBox(
              width: 8.0), // Spacing between progress bar and percentage
          Text(
            "${(percentage * 100).toInt()} %", // Display percentage
            style: TextStyle(fontSize: 16.0, color: Palette.black),
          ),
        ],
      ),
    );
  }
}

// Data model for a single performance item
class PerformanceData {
  final String label;
  final double percentage; // Value between 0.0 and 1.0

  PerformanceData({required this.label, required this.percentage});
}
