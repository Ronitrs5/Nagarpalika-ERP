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
        title: const Text("Welcome back"),
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

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [

              Image.asset(
                "assets/icon_world.png",
              width: 250,
              height: 250,),

              Container(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green[50], // Set the background color here
                      elevation: 0.0,
                    ),
                    onPressed: (){

                    },
                    child: const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text("How does our app work?",
                        style: TextStyle(
                          color: Colors.black
                      ),),
                    )
                ),
              ),

              Divider(
                color: Colors.green[900],
                indent: 10,
                endIndent: 10,
                height: 30,
              ),
              
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 16),
                child: Text("Quick Information",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),),
              ),
              
              Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.green[50],
                              borderRadius: BorderRadius.circular(70)
                          ),
                          padding: const EdgeInsets.all(20),
                          child: Image.asset(
                            'assets/icon_aboutus.png', // Replace with your image asset path
                            width: 20, // Set the width of the image
                            height: 20, // Set the height of the image
                            fit: BoxFit.cover, // Fit the image within the button bounds
                          ),
                        ),

                        const SizedBox(height: 10,),

                        const Text("About Us",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold
                          ),)
                        
                      ],
                    ),

                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.green[50],
                              borderRadius: BorderRadius.circular(70)
                          ),
                          padding: const EdgeInsets.all(20),
                          child: Image.asset(
                            'assets/icon_process.png', // Replace with your image asset path
                            width: 20, // Set the width of the image
                            height: 20, // Set the height of the image
                            fit: BoxFit.cover, // Fit the image within the button bounds
                          ),
                        ),

                        const SizedBox(height: 10,),

                        const Text("Process",
                          style: TextStyle(
                              fontSize: 14,
                            fontWeight: FontWeight.bold
                          ),)

                      ],
                    ),

                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.green[50],
                              borderRadius: BorderRadius.circular(70)
                          ),
                          padding: const EdgeInsets.all(20),
                          child: Image.asset(
                            'assets/icon_permissions.png', // Replace with your image asset path
                            width: 20, // Set the width of the image
                            height: 20, // Set the height of the image
                            fit: BoxFit.cover, // Fit the image within the button bounds
                          ),
                        ),

                        const SizedBox(height: 10,),

                        const Text("Permissions",
                          style: TextStyle(
                              fontSize: 14,
                            fontWeight: FontWeight.bold
                          ),)

                      ],
                    ),
                  ],
                ),
              ),


              Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.green[50],
                              borderRadius: BorderRadius.circular(70)
                          ),
                          padding: const EdgeInsets.all(20),
                          child: Image.asset(
                            'assets/icon_feedbacks.png', // Replace with your image asset path
                            width: 20, // Set the width of the image
                            height: 20, // Set the height of the image
                            fit: BoxFit.cover, // Fit the image within the button bounds
                          ),
                        ),

                        const SizedBox(height: 10,),

                        const Text("Feedback",
                          style: TextStyle(
                              fontSize: 14,
                            fontWeight: FontWeight.bold
                          ),)

                      ],
                    ),


                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.green[50],
                              borderRadius: BorderRadius.circular(70)
                          ),
                          padding: const EdgeInsets.all(20),
                          child: Image.asset(
                            'assets/icon_faq.png', // Replace with your image asset path
                            width: 20, // Set the width of the image
                            height: 20, // Set the height of the image
                            fit: BoxFit.cover, // Fit the image within the button bounds
                          ),
                        ),

                        const SizedBox(height: 10,),

                        const Text("FAQs",
                          style: TextStyle(
                              fontSize: 14,
                            fontWeight: FontWeight.bold
                          ),)

                      ],
                    ),



                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.green[50],
                              borderRadius: BorderRadius.circular(70)
                          ),
                          padding: const EdgeInsets.all(20),
                          child: Image.asset(
                            'assets/icon_help.png', // Replace with your image asset path
                            width: 20, // Set the width of the image
                            height: 20, // Set the height of the image
                            fit: BoxFit.cover, // Fit the image within the button bounds
                          ),
                        ),

                        const SizedBox(height: 10,),

                        const Text("Help Center",
                          style: TextStyle(
                              fontSize: 14,
                            fontWeight: FontWeight.bold
                          ),)

                      ],
                    ),
                  ],
                ),
              ),





            ],
          ),
        ),
      ),
    );
  }
}