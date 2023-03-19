import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinksPage extends StatefulWidget {
  @override
  _LinksPageState createState() => _LinksPageState();
}

class _LinksPageState extends State<LinksPage> {
  final dsLink = 'https://www.geeksforgeeks.org/data-structures/';
  final cnLink = 'https://www.geeksforgeeks.org/computer-networks/';
  final osLink = 'https://www.geeksforgeeks.org/operating-systems/';

  final dsVideo = 'https://youtu.be/3cU__spdMIw';
  final cnVideo = 'https://youtu.be/4D55Cmj2t-A';
  final osVideo = 'https://youtu.be/bkSWJJZNgf8';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Subject Links'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                launchURL(dsLink);
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.yellow),
              ),
              child: Text('Data Structures'),
            ),
            ElevatedButton(
              onPressed: () {
                launchURL(cnLink);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: Text('Computer Networks'),
            ),
            ElevatedButton(
              onPressed: () {
                launchURL(osLink);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              child: Text('Operating Systems'),
            ),
            SizedBox(height: 25),
            Text(
              'Video Tutorials:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                launchURL(dsVideo);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              child: Text('Data Structures'),
            ),
            ElevatedButton(
              onPressed: () {
                launchURL(cnVideo);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.pink),
              ),
              child: Text('Computer Networks'),
            ),
            ElevatedButton(
              onPressed: () {
                launchURL(osVideo);
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.deepPurple),
              ),
              child: Text('Operating Systems'),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to launch URLs
  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
