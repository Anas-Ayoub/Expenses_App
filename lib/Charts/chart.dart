import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:expense_tracker/models/expense.dart';

class Chart extends StatefulWidget {
  const Chart(this.getCategorieSum, {super.key});

  final double Function(Category) getCategorieSum;

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    Widget getTitles(double value, TitleMeta meta) {
      const style = TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      );
      IconData icon;
      switch (value.toInt()) {
        case 0:
          icon = Icons.shopping_basket;
          break;
        case 1:
          icon = Icons.flight;
          break;
        case 2:
          icon = Icons.lunch_dining;
          break;
        case 3:
          icon = Icons.music_note;
          break;
        case 4:
          icon = Icons.work;
          break;
        case 5:
          icon = Icons.pets;
          break;
        default:
          icon = Icons.stop_circle;
          break;
      }
      return SideTitleWidget(
        axisSide: meta.axisSide,
        space: 4,
        child: Icon(icon),
      );
    }

    FlTitlesData titlesData() {
      return FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );
    }

    BarTouchData barTouchData() {
      return BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: const Color.fromARGB(0, 231, 0, 0),
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              "\$${rod.toY.round()}",
              const TextStyle(
                color: Colors.cyan,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );
    }

    LinearGradient _barsGradient() {
      return const LinearGradient(
        colors: [
          Colors.purple,
          Colors.deepPurple,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );
    }

    List<BarChartGroupData> barGroups() {
      return [
        BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(
              toY: widget.getCategorieSum(Category.shopping),
              gradient: _barsGradient(),
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(
              toY: widget.getCategorieSum(Category.travel),
              gradient: _barsGradient(),
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(
              toY: widget.getCategorieSum(Category.food),
              gradient: _barsGradient(),
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(
              toY: widget.getCategorieSum(Category.entertainment),
              gradient: _barsGradient(),
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 4,
          barRods: [
            BarChartRodData(
              toY: widget.getCategorieSum(Category.work),
              gradient: _barsGradient(),
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 5,
          barRods: [
            BarChartRodData(
              toY: widget.getCategorieSum(Category.pets),
              gradient: _barsGradient(),
            )
          ],
          showingTooltipIndicators: [0],
        ),
      ];
    }

    return 
    // Container(
    //   decoration:const BoxDecoration(
    //     gradient: LinearGradient(colors: [
    //       Color.fromARGB(255, 22, 80, 134),
    //       Color.fromARGB(255, 109, 191, 230),
    //     ], begin: Alignment.topLeft, end: Alignment.bottomRight),
    //   ),
      BarChart(
        BarChartData(
          backgroundColor: Color.fromARGB(82, 33, 0, 43),
          barTouchData: barTouchData(),
          alignment: BarChartAlignment.spaceAround,
          borderData: FlBorderData(show: true),
          gridData: const FlGridData(show: false),
          titlesData: titlesData(),
          barGroups: barGroups(),
        ),
          swapAnimationDuration: const Duration(milliseconds: 650), // Optional
  swapAnimationCurve: Curves.linear, // Optional
      //),
    );
  }
}
