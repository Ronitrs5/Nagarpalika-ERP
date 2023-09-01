import 'package:flutter/material.dart';
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text("Dashboard"),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
          AspectRatio(
            aspectRatio: 1.0,
            child: SizedBox(
              width: double.infinity,
              child: Card(
              elevation: 4, // Controls the shadow of the card
              margin: const EdgeInsets.all(16), // Margin around the card
              child: Container(
                padding: const EdgeInsets.all(16), // Padding inside the card
                child: const Text(
                  'Collection',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
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
