import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final double percentage1 = 84.88; // Set your desired percentage here
  final double percentage2 = 99.49; // Set your desired percentage here
  final double percentage3 = 74.78; // Set your desired percentage here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text("Dashboard"),
      ),
      body:
      SingleChildScrollView(
        child: Column(
          children: [

            AspectRatio(
              aspectRatio: 1.0,
              child: SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 4,
                  margin: const EdgeInsets.all(16),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Collection',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              height: 120,
                              width: 120,
                              child: CircularProgressIndicator(
                                color: Colors.lightGreen,
                                backgroundColor: Colors.blueGrey,
                                value: percentage1 / 100,
                                strokeWidth: 22,
                              ),
                            ),
                            Text(
                              '$percentage1%',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                          },
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('View details'),
                              Icon(Icons.arrow_downward),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),



            AspectRatio(
              aspectRatio: 1.0,
              child: SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 4,
                  margin: const EdgeInsets.all(16),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Segregation',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              height: 120,
                              width: 120,
                              child: CircularProgressIndicator(
                                color: Colors.green,
                                backgroundColor: Colors.blueGrey,
                                value: percentage2 / 100,
                                strokeWidth: 22,
                              ),
                            ),
                            Text(
                              '$percentage2%',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                          },
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('View details'),
                              Icon(Icons.arrow_downward),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),


            AspectRatio(
              aspectRatio: 1.0,
              child: SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 4,
                  margin: const EdgeInsets.all(16),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Attendance',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              height: 120,
                              width: 120,
                              child: CircularProgressIndicator(
                                color: Colors.orangeAccent,
                                backgroundColor: Colors.blueGrey,
                                value: percentage3 / 100,
                                strokeWidth: 22,
                              ),
                            ),
                            Text(
                              '$percentage3%',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {

                          },
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('View details'),
                              Icon(Icons.arrow_downward),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
