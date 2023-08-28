import 'package:flutter/material.dart';

class DescriptionPage extends StatefulWidget {
  const DescriptionPage({Key? key}) : super(key: key);

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Description"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "मलाकाचे आगर वहिवाटदाराचे\nवापरतील जगेचे वर्णन: ",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),


            SizedBox(width: 16),

            Padding(

              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16), // Add horizontal padding
              child: Table(
                border: TableBorder.all(color: Colors.black),
                columnWidths: {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(2),
                },
                children: [
                  _buildTableRow("खोली प्रकार:", "", ),
                  _buildTableRow("मालकाचे, भाडेकरूचे/भोगवतदाराचेनाव :", "", ),
                  _buildTableRow("वापराचा: प्राकार:", "", ),
                  _buildTableRow("खोलीची रुंदी:", "", ),
                  _buildTableRow("खोलीची लांबी:", "", ),
                  _buildTableRow("एकुण क्षेत्र (चौ.मी.):", "", ),
                  _buildTableRow("प्रत्यक्ष मासिक भाडे:", "", ),
                ],
              ),
            ),

            SizedBox(height: 16), // Add spacing

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Add your button logic here
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // Set the background color to red
                  ),
                  child: Text("रद"),
                ),


                ElevatedButton(
                  onPressed: () {
                    // Add your button logic here
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey, // Set the background color
                  ),
                  child: Text("नवीन जोडा"),
                ),

                ElevatedButton(
                  onPressed: () {
                    // Add your button logic here
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // Set the background color
                  ),
                  child: Text("सेव"),
                ),
              ],
            ),
            SizedBox(width: 16),

          ],
        ),


      ),
    );
  }

  TableRow _buildTableRow(String labelText, String hintText) {
    return TableRow(
      children: [
        TableCell(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: Text(
              labelText,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
        ),
        TableCell(
          child: Container(
            color: Colors.grey[200], // Set your desired background color
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: hintText,
                contentPadding: EdgeInsets.fromLTRB(16, 5, 16, 5),
              ),
            ),
          ),
        ),
      ],
    );
  }


}


void main() {
  runApp(MaterialApp(
    home: DescriptionPage(),
  ));
}


