import 'package:flutter/material.dart';
import 'package:house_cleaning/ui/home/new_registration.dart';

class SearchAssessment extends StatefulWidget {
  const SearchAssessment({Key? key}) : super(key: key);

  @override
  State<SearchAssessment> createState() => _SearchAssessmentState();
}

class _SearchAssessmentState extends State<SearchAssessment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Assessment Number"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Text(
                "Assessment Number ",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter your assessment number', // Add your hint text here
                    border: InputBorder.none, // Remove the default border
                    contentPadding: EdgeInsets.all(16), // Add padding inside the input field
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: ElevatedButton(
                onPressed: () {
                  // Handle the first button's onPressed action
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> NewRegistrationPage()));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green, // Set the button color to red
                ),
                child: Text('Search'),
              ),


            )

          ],
        ),
      ),
    );
  }
}
