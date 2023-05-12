// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

// Flutter 3.7.7
class StackedLine extends StatelessWidget {
  final String title;

  const StackedLine({super.key, required this.title});

  static const String routeName = '/peter-charts_stacked';

//legend
  Legend buildLegend() {
    return Legend(
      isVisible: true,
      overflowMode: LegendItemOverflowMode.scroll,
      position: LegendPosition.bottom,
      padding: 10,
    );
  }

// ChartTitle
  ChartTitle buildChartTitle() {
    return ChartTitle(
      text: 'Product expenses [Dec. 2021 - Dec. 2022]',
      alignment: ChartAlignment.center,
    );
  }

  // Line Series
  List<LineSeries<ProductSales, DateTime>> getLineSeries(
      List<ChartData> chartData) {
    return chartData
        .map(
          (e) => LineSeries<ProductSales, DateTime>(
            name: e.product.name,
            dataSource: e.product.sales,
            xValueMapper: (ProductSales sales, _) => sales.month,
            yValueMapper: (ProductSales sales, _) => sales.amount,
            dataLabelSettings: const DataLabelSettings(isVisible: false),
            color: e.lineColor,
            markerSettings: const MarkerSettings(isVisible: true),
          ),
        )
        .toList();
  }

//ChartSeries
  List<ChartSeries> getSeries() {
    final List<ChartData> chartData = getChartData();
    return getLineSeries(chartData);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 700,
              child: SfCartesianChart(
                trackballBehavior: TrackballBehavior(
                  lineType: TrackballLineType.none,
                  activationMode: ActivationMode.singleTap,
                  enable: true,
                  builder: (BuildContext context,
                      TrackballDetails trackballDetails) {
                    return Container(
                      padding: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        color: Color.alphaBlend(Colors.blue, Colors.white),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(6.0)),
                      ),
                      child: Text('${trackballDetails.point!.y}',
                          style: const TextStyle(color: Colors.white)),
                    );
                  },
                ),
                title: buildChartTitle(),
                tooltipBehavior: TooltipBehavior(enable: true),
                legend: buildLegend(),
                primaryXAxis: DateTimeAxis(
                  interval: 1,
                  dateFormat: DateFormat('MMM yy'),
                  majorGridLines: const MajorGridLines(width: 0),
                ),
                primaryYAxis: NumericAxis(
                    minimum: 1000,
                    maximum: 8000,
                    interval: 1000,
                    axisLine: const AxisLine(width: 0),
                    majorTickLines: const MajorTickLines(size: 0),
                    labelFormat: '{value}'),
                series: getSeries(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<ChartData> getChartData() {
    Product product1 = Product('Kiks', [
      ProductSales(DateTime(2021, 12), 5000),
      ProductSales(DateTime(2022, 1), 7000),
      ProductSales(DateTime(2022, 2), 5000),
      ProductSales(DateTime(2022, 3), 6000),
      ProductSales(DateTime(2022, 4), 4000),
      ProductSales(DateTime(2022, 5), 5000),
      ProductSales(DateTime(2022, 6), 2000),
      ProductSales(DateTime(2022, 7), 3000),
      ProductSales(DateTime(2022, 8), 4000),
      ProductSales(DateTime(2022, 9), 5000),
      ProductSales(DateTime(2022, 10), 4000),
      ProductSales(DateTime(2022, 11), 2000),
      ProductSales(DateTime(2022, 12), 4000),
    ]);
    Product product2 = Product('Ketchup', [
      ProductSales(DateTime(2021, 12), 3000),
      ProductSales(DateTime(2022, 1), 5000),
      ProductSales(DateTime(2022, 2), 4000),
      ProductSales(DateTime(2022, 3), 2000),
      ProductSales(DateTime(2022, 4), 6000),
      ProductSales(DateTime(2022, 5), 2000),
      ProductSales(DateTime(2022, 6), 3000),
      ProductSales(DateTime(2022, 7), 2000),
      ProductSales(DateTime(2022, 8), 3000),
      ProductSales(DateTime(2022, 9), 2000),
      ProductSales(DateTime(2022, 10), 2000),
      ProductSales(DateTime(2022, 11), 5000),
      ProductSales(DateTime(2022, 12), 2000),
    ]);
    Product product3 = Product('Mango', [
      ProductSales(DateTime(2021, 12), 8000),
      ProductSales(DateTime(2022, 1), 4000),
      ProductSales(DateTime(2022, 2), 7000),
      ProductSales(DateTime(2022, 3), 4000),
      ProductSales(DateTime(2022, 4), 3000),
      ProductSales(DateTime(2022, 5), 5000),
      ProductSales(DateTime(2022, 6), 4000),
      ProductSales(DateTime(2022, 7), 5000),
      ProductSales(DateTime(2022, 8), 2000),
      ProductSales(DateTime(2022, 9), 7000),
      ProductSales(DateTime(2022, 10), 6000),
      ProductSales(DateTime(2022, 11), 4000),
      ProductSales(DateTime(2022, 12), 6000),
    ]);
    Product product4 = Product('Nudler', [
      ProductSales(DateTime(2021, 12), 2000),
      ProductSales(DateTime(2022, 1), 3000),
      ProductSales(DateTime(2022, 2), 2000),
      ProductSales(DateTime(2022, 3), 5000),
      ProductSales(DateTime(2022, 4), 2000),
      ProductSales(DateTime(2022, 5), 7000),
      ProductSales(DateTime(2022, 6), 6000),
      ProductSales(DateTime(2022, 7), 2000),
      ProductSales(DateTime(2022, 8), 5000),
      ProductSales(DateTime(2022, 9), 4000),
      ProductSales(DateTime(2022, 10), 3000),
      ProductSales(DateTime(2022, 11), 2000),
      ProductSales(DateTime(2022, 12), 3000),
    ]);
    Product product5 = Product('Faxe Kondi', [
      ProductSales(DateTime(2021, 12), 4000),
      ProductSales(DateTime(2022, 1), 2000),
      ProductSales(DateTime(2022, 2), 3000),
      ProductSales(DateTime(2022, 3), 5000),
      ProductSales(DateTime(2022, 4), 6000),
      ProductSales(DateTime(2022, 5), 1000),
      ProductSales(DateTime(2022, 6), 5000),
      ProductSales(DateTime(2022, 7), 7000),
      ProductSales(DateTime(2022, 8), 6000),
      ProductSales(DateTime(2022, 9), 3000),
      ProductSales(DateTime(2022, 10), 6000),
      ProductSales(DateTime(2022, 11), 6000),
      ProductSales(DateTime(2022, 12), 5000),
    ]);

    final List<ChartData> chartData = [
      ChartData(product1, Colors.red),
      ChartData(product2, Colors.green),
      ChartData(product3, Colors.blue),
      ChartData(product4, Colors.amber),
      ChartData(product5, Colors.teal),
    ];

    return chartData;
  }
}

class ChartData {
  final Product product;
  final Color lineColor;

  ChartData(this.product, this.lineColor);
}

class ProductSales {
  ProductSales(this.month, this.amount);
  final int amount;
  final DateTime month;
}

class Product {
  Product(this.name, this.sales);
  final String name;
  final List<ProductSales> sales;
}
