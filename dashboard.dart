import 'package:flutter/material.dart';
import 'package:helloworld/help.dart';
import 'package:helloworld/offcampus.dart';
import 'package:helloworld/result.dart';
import 'package:helloworld/TrainingScreen.dart';
import 'package:helloworld/upcoming.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1f566d),
      appBar: AppBar(
        title: Text("MY DASHBOARD"),
        elevation: .1,
        backgroundColor: Colors.black,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.notifications),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 25.0),
                      Text(
                        'Welcome, User',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.all(3.0),
                children: <Widget>[
                  makeDashboardItem("Upcoming drives", Icons.calendar_today,
                      UpcomingDrivesScreen, 0),
                  makeDashboardItem("Training Materials", Icons.book,
                      TrainingMaterialsPage, 1),
                  makeDashboardItem(
                      "Ask for help", Icons.help, FeedbackAndHelpPage, 2),
                  makeDashboardItem("View drive results", Icons.bar_chart,
                      DepartmentWiseDriveResults, 3),
                  makeDashboardItem("offcampus drives", Icons.calendar_view_day,
                      DepartmentWiseDriveResults, 4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Card makeDashboardItem(
      String title, IconData icon, Type upcomingDrivesScreen, int index) {
    return Card(
        elevation: 1.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
          child: new InkWell(
            onTap: () {
              if (index == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UpcomingDrivesScreen()),
                );
              }
              if (index == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TrainingMaterialsPage()),
                );
              }
              if (index == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FeedbackAndHelpPage()),
                );
              }
              if (index == 3) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DepartmentWiseDriveResults()),
                );
              }
              if (index == 4) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OffCampusDrives()),
                );
              }
              if (index == 5) {
                //6.item
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 50.0),
                Center(
                    child: Icon(
                  icon,
                  size: 40.0,
                  color: Colors.black,
                )),
                SizedBox(height: 20.0),
                new Center(
                  child: new Text(title,
                      style:
                          new TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            ),
          ),
        ));
  }
}
