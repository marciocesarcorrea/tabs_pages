import 'package:flutter/material.dart';
import 'package:tabs_pages/pages/details.page.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Text(
            "Setting",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Center(
            child: RaisedButton(
              child: Text('Details'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailsPage()),
                );
              },
            ),
          ),
        ])
    );
  }
}