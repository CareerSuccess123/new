import 'package:flutter/material.dart';
import 'package:helloworld/aptitude.dart';
import 'package:helloworld/coresubjects.dart';
import 'package:helloworld/interview.dart';
import 'package:helloworld/programming.dart';

class TrainingMaterialsPage extends StatelessWidget {
  final List<Map<String, dynamic>> _categories = [
    {
      'title': 'Quantitative Aptitude',
      'icon': Icons.calculate,
      'index': 0,
    },
    {
      'title': 'Programming',
      'icon': Icons.code,
      'index': 1,
    },
    {
      'title': 'Interview Preparation',
      'icon': Icons.record_voice_over,
      'index': 2,
    },
    {
      'title': 'Core Subjects',
      'icon': Icons.school,
      'index': 3,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1f566d),
      appBar: AppBar(
        title: Text('Training Materials'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(16.0),
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          children: _categories.map((category) {
            return makeCategoryItem(context, category['title'],
                category['icon'], category['index']);
          }).toList(),
        ),
      ),
    );
  }

  Card makeCategoryItem(
      BuildContext context, String title, IconData icon, int index) {
    return Card(
      elevation: 1.0,
      child: InkWell(
        onTap: () {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Aptitude()),
            );
          }
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProgrammingQuestionsPage()),
            );
          }
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CodingQuestions()),
            );
          }
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LinksPage()),
            );
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 64.0),
            SizedBox(height: 16.0),
            Text(
              title,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
