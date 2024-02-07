import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class StatusGraph extends StatelessWidget {
  const StatusGraph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.5,
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(
            show: false,
          ),
          titlesData: const FlTitlesData(
            show: false,
          ),
          borderData: FlBorderData(
            show: false,
          ),
          lineBarsData: [
            LineChartBarData(
              spots: const [
                FlSpot(0, 1),
                FlSpot(1, 1.5),
                FlSpot(2, 1.4),
                FlSpot(3, 3.4),
                FlSpot(4, 2),
                FlSpot(5, 2.2),
                FlSpot(6, 1.8),
              ],
              isCurved: true,
              color: Colors.green,
              barWidth: 2,
              dotData: const FlDotData(
                show: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
