import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class Histrograme extends StatefulWidget {
  const Histrograme({super.key});

  @override
  State<Histrograme> createState() => _HistrogrameState();
}

class _HistrogrameState extends State<Histrograme> {
  List<_SalesData> data = [
    _SalesData('Jan', 500),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 45)
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SfCartesianChart(
          title: ChartTitle(
            text: "Pramodoo",
          ),
          primaryXAxis: CategoryAxis(),
          legend: Legend(isVisible: true),
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <CartesianSeries<_SalesData, String>>[
            BarSeries<_SalesData, String>(
                dataSource: data,
                xValueMapper: (_SalesData sales, _) => sales.year,
                yValueMapper: (_SalesData sales, _) => sales.sales,
                name: 'Sales',
                // Enable data label
                dataLabelSettings: const DataLabelSettings(isVisible: true),
                color: Color.fromARGB(255, 68, 137, 255)),
          ],
        ),
      ],
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
