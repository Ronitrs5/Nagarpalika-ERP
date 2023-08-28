import 'package:flutter/material.dart';
import 'package:house_cleaning/ui/home/description.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PropertyDetails extends StatefulWidget {
  const PropertyDetails({Key? key}) : super(key: key);

  @override
  State<PropertyDetails> createState() => _PropertyDetailsState();
}

class _PropertyDetailsState extends State<PropertyDetails> {
  int selectedRadio = 0; // Track the selected radio button
  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

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
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DescriptionPage()));
            },
          ),
        ],
        title: Text("Details of your property"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.calendar_month),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  labelText: 'इमरत वापर सुरु झाल्येचे अर्थिक वर्ष:',
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.numbers),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  labelText: 'भाडे मुल्य झोन क्रमांक:',
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'इमारतीचे प्रत:', // Radio group title
                        style: TextStyle(fontSize: 18.0),
                      ),

                      Center(
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  height: 1000,
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Text('प्राकार अ: पहिल्या प्रतिचे बांधकाम'),
                                      ),
                                      Divider(),
                                      ListTile(
                                        title: Text('प्राकार ब: दुय्यम प्रतिचे बांधकाम'),
                                      ),
                                      Divider(),
                                      ListTile(
                                        title: Text('प्राकार क: साधरण दुय्यम प्रतिचे बांधकाम'),
                                      ),

                                      Divider(),
                                      ListTile(
                                        title: Text('प्राकार ड: साधरण प्रतिचे बांधकाम'),
                                      ),

                                      Divider(),
                                      ListTile(
                                        title: Text('प्राकार इ: निकृष्ट प्रतिचे बांधकाम'),
                                      ),

                                      Divider(),
                                      ListTile(
                                        title: Text('प्राकार ई: तात्पुरते प्रतिचे बांधकाम'),
                                      ),

                                      Divider(),

                                      ElevatedButton(
                                        onPressed: () {
                                          _showImageDialog(context);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.green, // Set the button color to red
                                        ),
                                        child: Text('In detail'),
                                      ),

                                      // ... Add more list items or widgets as needed
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Icon(Icons.info_outline_rounded),
                        ),
                      ),

                    ],
                  ),
                  RadioListTile(
                    title: Text('प्राकार अ'),
                    value: 1,
                    groupValue: selectedRadio,
                    onChanged: (val) {
                      setSelectedRadio(1);
                    },
                  ),
                  RadioListTile(
                    title: Text('प्राकार ब'),
                    value: 2,
                    groupValue: selectedRadio,
                    onChanged: (val) {
                      setSelectedRadio(2);
                    },
                  ),
                  RadioListTile(
                    title: Text('प्राकार क'),
                    value: 3,
                    groupValue: selectedRadio,
                    onChanged: (val) {
                      setSelectedRadio(3);
                    },
                  ),
                  RadioListTile(
                    title: Text('प्राकार ड'),
                    value: 4,
                    groupValue: selectedRadio,
                    onChanged: (val) {
                      setSelectedRadio(4);
                    },
                  ),
                  RadioListTile(
                    title: Text('प्राकार इ'),
                    value: 5,
                    groupValue: selectedRadio,
                    onChanged: (val) {
                      setSelectedRadio(5);
                    },
                  ),
                  RadioListTile(
                    title: Text('प्राकार ई'),
                    value: 6,
                    groupValue: selectedRadio,
                    onChanged: (val) {
                      setSelectedRadio(6);
                    },
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.add_road),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  labelText: 'इमरत समोर रस्ता: ',
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'रस्ता:', // Radio group title
                    style: TextStyle(fontSize: 18.0),
                  ),
                  RadioListTile(
                    title: Text('कच्चा'),
                    value: 1,
                    groupValue: selectedRadio,
                    onChanged: (val) {
                      setSelectedRadio(1);
                    },
                  ),
                  RadioListTile(
                    title: Text('पक्का'),
                    value: 2,
                    groupValue: selectedRadio,
                    onChanged: (val) {
                      setSelectedRadio(2);
                    },
                  ),
                ],
              ),
            ),



            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'सांडपाण्याची व्‍यवस्‍था:', // Radio group title
                    style: TextStyle(fontSize: 18.0),
                  ),
                  RadioListTile(
                    title: Text('आहे'),
                    value: 1,
                    groupValue: selectedRadio,
                    onChanged: (val) {
                      setSelectedRadio(1);
                    },
                  ),
                  RadioListTile(
                    title: Text('नाही'),
                    value: 2,
                    groupValue: selectedRadio,
                    onChanged: (val) {
                      setSelectedRadio(2);
                    },
                  ),
                ],
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'पाणी कनेक्शन:', // Radio group title
                    style: TextStyle(fontSize: 18.0),
                  ),
                  RadioListTile(
                    title: Text('आहे'),
                    value: 1,
                    groupValue: selectedRadio,
                    onChanged: (val) {
                      setSelectedRadio(1);
                    },
                  ),
                  RadioListTile(
                    title: Text('नाही'),
                    value: 2,
                    groupValue: selectedRadio,
                    onChanged: (val) {
                      setSelectedRadio(2);
                    },
                  ),
                ],
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  labelText: 'कनेक्शन धारकाचे नाव:',
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.bathtub),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  labelText: 'संडास सांख्या:',
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'ड्रेनेज:', // Radio group title
                    style: TextStyle(fontSize: 18.0),
                  ),
                  RadioListTile(
                    title: Text('आहे'),
                    value: 1,
                    groupValue: selectedRadio,
                    onChanged: (val) {
                      setSelectedRadio(1);
                    },
                  ),
                  RadioListTile(
                    title: Text('नाही'),
                    value: 2,
                    groupValue: selectedRadio,
                    onChanged: (val) {
                      setSelectedRadio(2);
                    },
                  ),
                ],
              ),
            ),

            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
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
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle the second button's onPressed action
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green, // Set the button color to green
                      ),
                      child: Text('Save'),
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
  void _showImageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context); // Close the dialog when tapped
            },
            child: Container(
              color: Colors.black, // Set the background color
              width: double.infinity,
              height: double.infinity,
              child: PhotoView(
                imageProvider: AssetImage('assets/info.jpeg'), // Replace with your image
                minScale: PhotoViewComputedScale.contained * 0.8,
                maxScale: PhotoViewComputedScale.covered * 2.5,
                initialScale: PhotoViewComputedScale.contained,
              ),
            ),
          ),
        );
      },
    );
  }


}
