import 'package:flutter/material.dart';
import 'package:house_cleaning/ui/home/description.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:house_cleaning/ui helper/pop_up_dialogue.dart';

class PropertyDetails extends StatefulWidget {
  const PropertyDetails({Key? key}) : super(key: key);

  @override
  State<PropertyDetails> createState() => _PropertyDetailsState();
}

class _PropertyDetailsState extends State<PropertyDetails> {
  int selectedRadio = 0;
  // int groupRoad=0;
  // int groupSandPani=0;
  // int groupPani=0;
  // int groupDrainage=0;

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
            icon: const Icon(Icons.info_outline_rounded),
            iconSize: 24,// Add your desired icon here
            onPressed: () {
              _showCloudyMessagePopup(context);
            },
          ),
        ],
        title: const Text("Details of your property"),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
              child: DropdownButtonFormField<int>(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.calendar_month),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  labelText: 'इमरत वापर सुरु झाल्येचे आर्थिक वर्ष:',

                ),
                items: generateYearItems(),
                onChanged: (value) {
                  // Handle the selected year value
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.numbers),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  labelText: 'भाडे मुल्य झोन क्रमांक',
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
                      const Text(
                        'इमारतीचे प्रत:', // Radio group title
                        style: TextStyle(fontSize: 18.0),
                      ),

                      Center(
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return SizedBox(
                                  height: 5000,
                                  child: Column(
                                    children: [
                                      const ListTile(
                                        title: Text('प्रकार अ: पहिल्या प्रतिचे बांधकाम'),
                                      ),
                                      const Divider(),
                                      const ListTile(
                                        title: Text('प्रकार ब: दुय्यम प्रतिचे बांधकाम'),
                                      ),
                                      const Divider(),
                                      const ListTile(
                                        title: Text('प्रकार क: साधरण दुय्यम प्रतिचे बांधकाम'),
                                      ),

                                      const Divider(),
                                      const ListTile(
                                        title: Text('प्रकार ड: साधरण प्रतिचे बांधकाम'),
                                      ),

                                      const Divider(),
                                      const ListTile(
                                        title: Text('प्रकार इ: निकृष्ट प्रतिचे बांधकाम'),
                                      ),

                                      const Divider(),
                                      const ListTile(
                                        title: Text('प्रकार ई: तात्पुरते प्रतिचे बांधकाम'),
                                      ),

                                      const Divider(),

                                      ElevatedButton(
                                        onPressed: () {
                                          _showImageDialog(context);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.green, // Set the button color to red
                                        ),
                                        child: const Text('In detail'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: const Icon(Icons.info_outline_rounded),
                        ),
                      ),

                    ],
                  ),
                  RadioListTile(
                    title: const Text('प्रकार अ'),
                    value: 1,
                    groupValue: selectedRadio,
                    onChanged: (val) {
                      setSelectedRadio(1);
                    },
                  ),
                  RadioListTile(
                    title: const Text('प्रकार ब'),
                    value: 2,
                    groupValue: selectedRadio,
                    onChanged: (val) {
                      setSelectedRadio(2);
                    },
                  ),
                  RadioListTile(
                    title: const Text('प्रकार क'),
                    value: 3,
                    groupValue: selectedRadio,
                    onChanged: (val) {
                      setSelectedRadio(3);
                    },
                  ),
                  RadioListTile(
                    title: const Text('प्रकार ड'),
                    value: 4,
                    groupValue: selectedRadio,
                    onChanged: (val) {
                      setSelectedRadio(4);
                    },
                  ),
                  RadioListTile(
                    title: const Text('प्रकार इ'),
                    value: 5,
                    groupValue: selectedRadio,
                    onChanged: (val) {
                      setSelectedRadio(5);
                    },
                  ),
                  RadioListTile(
                    title: const Text('प्रकार ई'),
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
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.add_road),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  labelText: 'इमारत समोर रस्ता: ',
                ),
                items: const [
                  DropdownMenuItem(value: 'Option 1', child: Text('6 मीटर पर्यंत')),
                  DropdownMenuItem(value: 'Option 2', child: Text('6 ते 12 मीटर')),
                  DropdownMenuItem(value: 'Option 3', child: Text('12 ते 30 मीटर')),
                  DropdownMenuItem(value: 'Option 4', child: Text('30 मीटर पेक्षा अधिक')),
                ],
                onChanged: (value) {
                  // Handle dropdown value change
                },
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'रस्ता:', // Radio group title
                    style: TextStyle(fontSize: 18.0),
                  ),
                  RadioListTile(
                    title: const Text('कच्चा'),
                    value: 1,
                    groupValue: selectedRadio,
                    onChanged: (val) {
                      setSelectedRadio(1);
                    },
                  ),
                  RadioListTile(
                    title: const Text('पक्का'),
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
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'सांडपाण्याची व्‍यवस्‍था:', // Radio group title
                    style: TextStyle(fontSize: 18.0),
                  ),
                  RadioListTile(
                    title: const Text('आहे'),
                    value: 1,
                    groupValue: selectedRadio,
                    onChanged: (val) {
                      setSelectedRadio(1);
                    },
                  ),
                  RadioListTile(
                    title: const Text('नाही'),
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
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'पाणी कनेक्शन:', // Radio group title
                    style: TextStyle(fontSize: 18.0),
                  ),
                  RadioListTile(
                    title: const Text('आहे'),
                    value: 1,
                    groupValue: selectedRadio,
                    onChanged: (val) {
                      setSelectedRadio(1);
                    },
                  ),
                  RadioListTile(
                    title: const Text('नाही'),
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
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  labelText: 'कनेक्शन धारकाचे नाव',
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.bathtub),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  labelText: 'संडास संख्या',
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'ड्रेनेज:', // Radio group title
                    style: TextStyle(fontSize: 18.0),
                  ),
                  RadioListTile(
                    title: const Text('आहे'),
                    value: 1,
                    groupValue: selectedRadio,
                    onChanged: (val) {
                      setSelectedRadio(1);
                    },
                  ),
                  RadioListTile(
                    title: const Text('नाही'),
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
                      child: const Text('रद'),
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
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>DescriptionPage()));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey, // Set the button color to green
                      ),
                      child: const Text('सेव'),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DescriptionPage()));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green, // Set the button color to green
                      ),
                      child: const Text('पुढे'),
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
                imageProvider: const AssetImage('assets/info.jpeg'), // Replace with your image
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

  int currentYear = DateTime.now().year;

  List<DropdownMenuItem<int>> generateYearItems() {
    List<DropdownMenuItem<int>> items = [];
    for (int year = 1900; year <= currentYear; year++) {
      items.add(DropdownMenuItem(value: year, child: Text(year.toString())));
    }
    return items;
  }
  void _showCloudyMessagePopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PopUpDialogue(
          title: 'Disclaimer',
          message: "First save and then proceed to next.\nUnsaved information won't be restored",
        );
      },
    );
  }
}
