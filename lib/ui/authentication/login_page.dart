import 'package:flutter/material.dart';
import 'package:house_cleaning/ui/home/description.dart';
import 'package:house_cleaning/ui/home/navigation_drawer.dart';
import 'package:house_cleaning/ui/home/new_registration.dart';
import 'package:house_cleaning/ui/home/search_assessment.dart';
import 'package:house_cleaning/ui/home/property_details.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.blueAccent,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Center(
                child: Text(
                  'Your Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('Search assessment number'),
              onTap: () {
                // Implement the action when Home is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchAssessment()),
                );
              },
            ),

            Divider(),

            ListTile(
              leading: Icon(Icons.person_add_rounded),
              title: Text('New Registration'),
              onTap: () {
                // Implement the action when Home is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewRegistrationPage()),
                );
              },
            ),

            Divider(),

            ListTile(
              leading: Icon(Icons.info_outline_rounded),
              title: Text('Property Details'),
              onTap: () {
                // Implement the action when New Registration is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PropertyDetails()),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.description),
              title: Text('Description'),
              onTap: () {
                // Implement the action when Information is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DescriptionPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}