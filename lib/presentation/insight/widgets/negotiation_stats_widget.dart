import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:trademate_app/theme/palette.dart';

class NegotiationStatisticsWidget extends StatelessWidget {
  final int totalNegotiations;
  final double successPercentage; // Value between 0.0 and 1.0

  const NegotiationStatisticsWidget({
    Key? key,
    required this.totalNegotiations,
    required this.successPercentage,
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
            const Text(
              "Statistik Negosiasi", // Section Title
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0), // Spacing between title and content

            Row(
              children: [
                // Negotiation Count and Labels
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        totalNegotiations
                            .toString(), // Display total negotiations
                        style: const TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Palette.black,
                        ),
                      ),
                      const SizedBox(
                          height: 4.0), // Spacing between count and labels
                      Row(
                        children: [
                          const Icon(Icons.circle,
                              color: Palette.primaryDef,
                              size: 12), // Sukses color dot
                          const SizedBox(width: 4),
                          const Text("Sukses", style: TextStyle(fontSize: 14)),
                          const SizedBox(
                              width: 16), // Spacing between Sukses and Gagal
                          const Icon(Icons.circle,
                              color: Palette.primaryBgWeak,
                              size: 12), // Gagal color dot
                          const SizedBox(width: 4),
                          const Text("Gagal", style: TextStyle(fontSize: 14)),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                    width: 16.0), // Spacing between text and circular progress

                // Simple Circular Progress Indicator (Simulation)
                Container(
                  width: 80, // Fixed size for the circular indicator
                  height: 80,
                  child: CustomPaint(
                    painter: _CircularProgressPainter(
                      percentage:
                          successPercentage, // Use the provided percentage
                      strokeWidth: 8.0,
                      successColor: Palette.primaryDef, // Green for success
                      failureColor: Palette.primaryBgWeak, // Grey for failure
                    ),
                    child: Center(
                      child: Text(
                        "${(successPercentage * 100).toInt()} %", // Display percentage
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Palette
                              .primaryDef, // Green text color for percentage
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CircularProgressPainter extends CustomPainter {
  final double percentage;
  final double strokeWidth;
  final Color successColor;
  final Color failureColor;

  _CircularProgressPainter({
    required this.percentage,
    required this.strokeWidth,
    required this.successColor,
    required this.failureColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2) - strokeWidth / 2;

    // Draw the background circle (failure part)
    final failurePaint = Paint()
      ..color = failureColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;
    canvas.drawCircle(center, radius, failurePaint);

    // Draw the success arc
    final successPaint = Paint()
      ..color = successColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    // Calculate the sweep angle in radians
    final sweepAngle = 2 * pi * percentage;

    // Start the arc from the top (negative pi / 2)
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2, // Start angle
      sweepAngle, // Sweep angle
      false, // Use center
      successPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // Repaint only if the percentage changes
    return oldDelegate is _CircularProgressPainter &&
        oldDelegate.percentage != percentage;
  }
}
