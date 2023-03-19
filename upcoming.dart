import 'package:flutter/material.dart';

class Company {
  String name;
  String description;
  String logoPath;

  Company({
    required this.name,
    required this.description,
    required this.logoPath,
  });
}

class Drive {
  String date;
  String venue;
  Company company;

  Drive({required this.date, required this.venue, required this.company});
}

class UpcomingDrivesScreen extends StatelessWidget {
  final List<Drive> drives = [
    Drive(
      date: 'April 2, 2023',
      venue: 'TCS Office, Mumbai',
      company: Company(
        name: 'Tata Consultancy Services',
        description:
            'Tata Consultancy Services is an Indian multinational information technology services and consulting company.',
        logoPath: 'images/tcslogo.png',
      ),
    ),
    Drive(
      date: 'April 5, 2023',
      venue: 'Cognizant Office, Pune',
      company: Company(
        name: 'Cognizant',
        description:
            'Cognizant is an American multinational technology company that provides business consulting, information technology and outsourcing services.',
        logoPath: 'images/cognizantlogo.png',
      ),
    ),
    Drive(
      date: 'April 7, 2023',
      venue: 'CredAI Office, Bangalore',
      company: Company(
        name: 'CredAI',
        description:
            'CredAI is an Indian financial technology company that provides credit score analysis and credit card bill payment services.',
        logoPath: 'images/credailogo.png',
      ),
    )
  ];
  final List<Color> colors = [
    Colors.yellow,
    Colors.pinkAccent,
    Colors.purple,
    Colors.orange,
    Colors.purple,
  ];
  static var image;

  static var name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1f566d),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Upcoming Drives'),
      ),
      body: ListView.builder(
        itemCount: drives.length,
        itemBuilder: (context, index) {
          return Card(
            color: colors[index % colors.length],
            child: ListTile(
              leading: Image.asset(drives[index].company.logoPath),
              title: Text(drives[index].company.name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Date: ${drives[index].date}'),
                  Text('Venue: ${drives[index].venue}'),
                  Text(drives[index].company.description),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
