import 'package:flutter/material.dart';
import 'package:house_cleaning/ui/home/property_details.dart';

class NewRegistrationPage extends StatefulWidget {
  const NewRegistrationPage({Key? key}) : super(key: key);

  @override
  State<NewRegistrationPage> createState() => _NewRegistrationPageState();
}

class _NewRegistrationPageState extends State<NewRegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.navigate_next),
            iconSize: 35,// Add your desired icon here
            onPressed: () {
              // Add your icon button logic here
              Navigator.push(context, MaterialPageRoute(builder: (context)=>PropertyDetails()));
            },
          ),
        ],
        title: Text("New Registration"),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Text(
                "Reg. No. ",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(35, 20, 35, 0),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.confirmation_number_outlined),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  labelText: 'नोंदणी क्रमांक',
                ),
              ),
            ),

            Divider(height: 25,
            color: Colors.black38,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 35, 0),
              child: Text(
                "सर्व अवश्यक",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(35, 16, 35, 0),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.grid_on_outlined),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  labelText: 'सि.सि.नं./ रि.सि.नं./ गट नं.',
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(35, 16, 35, 0),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.streetview),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  labelText: 'वार्ड नं.',
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(35, 16, 35, 0),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.house),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  labelText: 'घर नं.',
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(35, 16, 35, 0),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  labelText: 'मालमता धारकाचे नाव.',
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(35, 16, 35, 0),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone_android),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  labelText: 'मोबाईल नं.',
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(35, 16, 35, 0),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  labelText: 'टेलिफोन नं.',
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(35, 16, 35, 0),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.surround_sound),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  labelText: 'परिसराचे नाव',
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(35, 16, 35, 0),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.place),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  labelText: 'जागा क्षेत्र',
                ),
              ),
            ),

            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(35, 20, 35, 16),
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle the first button's onPressed action
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red, // Set the button color to red
                      ),
                      child: Text('Clear'),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(35, 20, 35, 16),
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle the second button's onPressed action
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green, // Set the button color to green
                      ),
                      child: Text('Register'),
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
