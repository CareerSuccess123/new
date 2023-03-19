import 'package:flutter/material.dart';

class ViewMyResults extends StatelessWidget {
  final String company;
  final List<String> results;

  const ViewMyResults({Key? key, this.company = 'TCS', this.results = const []})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Results'),
      ),
      body: ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Download'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Implement download results functionality
        },
        child: Center(
          child: Icon(Icons.file_download),
        ),
        tooltip: 'Download Results',
      ),
    );
  }
}
