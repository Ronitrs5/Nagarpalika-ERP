import 'package:flutter/material.dart';
import 'package:house_cleaning/ui/home/new_registration.dart';
import 'package:http/http.dart' as http;

class SearchAssessment extends StatefulWidget {

  const SearchAssessment({Key? key}) : super(key: key);

  @override
  State<SearchAssessment> createState() => _SearchAssessmentState();
}

class _SearchAssessmentState extends State<SearchAssessment> {


  TextEditingController assessmentIdController= TextEditingController();

  Future<bool> getAssessment(String assessmentID) async {
    final url = Uri.parse('https://nagarpalika-erp-api.azurewebsites.net/api/PropertyByAssessmentNo/$assessmentID');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Assessment Number"),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
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
                  controller: assessmentIdController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your assessment number',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            //   child: ElevatedButton(
            //     onPressed: () async {
            //       final assessmentId= assessmentIdController.text;
            //       final assessmentSuccess=  await getAssessment(assessmentId);
            //
            //       if(assessmentSuccess){
            //         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Found')));
            //         Navigator.push(context, MaterialPageRoute(builder: (context)=> const NewRegistrationPage()));
            //       }
            //       else{
            //         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Error')));
            //
            //       }
            //
            //     },
            //     style: ElevatedButton.styleFrom(
            //       primary: Colors.green, // Set the button color to red
            //     ),
            //     child: const Text('Search'),
            //   ),
            // )

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
              child: ElevatedButton(
                onPressed: () async {
                  final assessmentId = assessmentIdController.text;
                  final assessmentSuccess = await getAssessment(assessmentId);

                  if (assessmentSuccess) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewRegistrationPage(),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Error')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green, // Set the button color to green
                ),
                child: const Text('Search'),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
