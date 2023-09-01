import 'package:flutter/material.dart';
import 'package:house_cleaning/ui/home/dashboard_page.dart';
import 'package:house_cleaning/ui/home/description.dart';
import 'package:house_cleaning/ui/home/navigation_drawer.dart';
import 'package:house_cleaning/ui/home/new_registration.dart';
import 'package:house_cleaning/ui/home/search_assessment.dart';
import 'package:house_cleaning/ui/home/property_details.dart';
import 'package:house_cleaning/ui/home/descone.dart';
import 'package:house_cleaning/ui/home/waste_collection.dart';
import 'package:lottie/lottie.dart';


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
        title: const Text("Home"),
        backgroundColor: Colors.blueAccent,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              padding: EdgeInsetsDirectional.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/recycle.png'), // Replace with your image
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            "Make world a\ncleaner place ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
            // Add other menu items here

            ListTile(
              leading: const Icon(Icons.search),
              title: const Text('Search assessment number'),
              onTap: () {
                // Implement the action when Home is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchAssessment()),
                );
              },
            ),

            const Divider(),

            ListTile(
              leading: const Icon(Icons.person_add_rounded),
              title: const Text('New Registration'),
              onTap: () {
                // Implement the action when Home is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NewRegistrationPage()),
                );
              },
            ),

            const Divider(),

            ListTile(
              leading: const Icon(Icons.info_outline_rounded),
              title: const Text('Property Details'),
              onTap: () {
                // Implement the action when New Registration is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PropertyDetails()),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.description),
              title: const Text('Description'),
              onTap: () {
                // Implement the action when Information is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DescriptionPage()),
                  // MaterialPageRoute(builder: (context)=>DescPage())
                );
              },
            ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Waste Collection'),
                onTap: () {
                  // Implement the action when Information is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const WasteCollectionPage()),
                    // MaterialPageRoute(builder: (context)=>DescPage())
                  );
                },
            ),

            const Divider(),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: () {
                // Implement the action when Information is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DashboardPage()),
                  // MaterialPageRoute(builder: (context)=>DescPage())
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}