import 'package:flutter/material.dart';
import "package:charts_flutter/flutter.dart" as charts;
import 'package:helloworld/view.dart';

class DriveResult {
  final String department;
  final String company;
  final double percentage;

  DriveResult(
      {required this.department,
      required this.company,
      required this.percentage});
}

class DepartmentWiseDriveResults extends StatelessWidget {
  final List<DriveResult> results = [
    DriveResult(department: 'CSE', company: 'TCS', percentage: 75.0),
    DriveResult(department: 'CSE', company: 'Cognizant', percentage: 60.0),
    DriveResult(department: 'ECE', company: 'TCS', percentage: 70.0),
    DriveResult(department: 'ECE', company: 'Cognizant', percentage: 65.0),
    DriveResult(department: 'CE', company: 'TCS', percentage: 80.0),
    DriveResult(department: 'CE', company: 'Cognizant', percentage: 70.0),
    DriveResult(department: 'EEE', company: 'TCS', percentage: 85.0),
    DriveResult(department: 'EEE', company: 'Cognizant', percentage: 75.0),
  ];

  List<charts.Series<DriveResult, String>> _createData() {
    return [
      charts.Series<DriveResult, String>(
        id: 'TCS',
        domainFn: (DriveResult result, _) => result.department,
        measureFn: (DriveResult result, _) => result.percentage,
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        data: results.where((result) => result.company == 'TCS').toList(),
        labelAccessorFn: (DriveResult result, _) =>
            '${result.department}: ${result.percentage}%',
      ),
      charts.Series<DriveResult, String>(
        id: 'Cognizant',
        domainFn: (DriveResult result, _) => result.department,
        measureFn: (DriveResult result, _) => result.percentage,
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        data: results.where((result) => result.company == 'Cognizant').toList(),
        labelAccessorFn: (DriveResult result, _) =>
            '${result.department}: ${result.percentage}%',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: C,rs
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(' Results'),
        actions: [
          IconButton(
            icon: Icon(Icons.download),
            onPressed: () {
              // TODO: Implement download functionality
            },
          ),
        ],
      ),
      body: charts.BarChart(
        _createData(),
        animate: true,
        barGroupingType: charts.BarGroupingType.grouped,
        vertical: false,
        behaviors: [charts.SeriesLegend()],
      ),
    );
  }
}
