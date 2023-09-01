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
  var buildingRadio = 0;
  var roadRadio=0;
  var sandpani=0;
  var waterconnection=0;
  var drainage=0;

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
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
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

            const Divider(height: 25,
              color: Colors.black26,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),


            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
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
                                return SingleChildScrollView(
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
                  // RadioListTile(
                  //   title: const Text('प्रकार अ'),
                  //   value: 1,
                  //   groupValue: buildingRadio,
                  //   onChanged: (val) {
                  //     setState(() {
                  //       buildingRadio=val!;
                  //     });
                  //   },
                  // ),
                  // RadioListTile(
                  //   title: const Text('प्रकार ब'),
                  //   value: 2,
                  //   groupValue: buildingRadio,
                  //   onChanged: (val) {
                  //     setState(() {
                  //       buildingRadio=val!;
                  //     });
                  //     },
                  // ),
                  // RadioListTile(
                  //   title: const Text('प्रकार क'),
                  //   value: 3,
                  //   groupValue: buildingRadio,
                  //   onChanged: (val) {
                  //     setState(() {
                  //       buildingRadio=val!;
                  //     });
                  //     },
                  // ),
                  // RadioListTile(
                  //   title: const Text('प्रकार ड'),
                  //   value: 4,
                  //   groupValue: buildingRadio,
                  //   onChanged: (val) {
                  //     setState(() {
                  //       buildingRadio=val!;
                  //     });
                  //     },
                  // ),
                  // RadioListTile(
                  //   title: const Text('प्रकार इ'),
                  //   value: 5,
                  //   groupValue: buildingRadio,
                  //   onChanged: (val) {
                  //     setState(() {
                  //       buildingRadio=val!;
                  //     });
                  //     },
                  // ),
                  // RadioListTile(
                  //   title: const Text('प्रकार ई'),
                  //   value: 6,
                  //   groupValue: buildingRadio,
                  //   onChanged: (val) {
                  //     setState(() {
                  //       buildingRadio=val!;
                  //     });
                  //     },
                  // ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.apartment),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        labelText: 'इमारतीचे प्रत', // Dropdown field label
                      ),
                      items: [
                        DropdownMenuItem(value: 'प्रकार अ', child: Text('प्रकार अ')),
                        DropdownMenuItem(value: 'प्रकार ब', child: Text('प्रकार ब')),
                        DropdownMenuItem(value: 'प्रकार क', child: Text('प्रकार क')),
                        DropdownMenuItem(value: 'प्रकार ड', child: Text('प्रकार ड')),
                        DropdownMenuItem(value: 'प्रकार इ', child: Text('प्रकार इ')),
                        DropdownMenuItem(value: 'प्रकार ई', child: Text('प्रकार ई')),
                      ],
                      onChanged: (value) {
                        // Handle dropdown value change
                      },
                    ),
                  ),
                ],
              ),
            ),

            const Divider(
              color: Colors.black26,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),


            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start, // Align the radio buttons to the start and end
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: 1,
                            groupValue: roadRadio,
                            onChanged: (val) {
                              setState(() {
                                roadRadio = val!;
                              });
                            },
                          ),
                          const Text('कच्चा'),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 2,
                            groupValue: roadRadio,
                            onChanged: (val) {
                              setState(() {
                                roadRadio = val!;
                              });
                            },
                          ),
                          const Text('पक्का'),
                        ],
                      ),
                    ],
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start, // Align the radio buttons to the start and end
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: 1,
                            groupValue: sandpani,
                            onChanged: (val) {
                              setState(() {
                                sandpani = val!;
                              });
                            },
                          ),
                          const Text('आहे'),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 2,
                            groupValue: sandpani,
                            onChanged: (val) {
                              setState(() {
                                sandpani = val!;
                              });
                            },
                          ),
                          const Text('नाही'),
                        ],
                      ),
                    ],
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start, // Align the radio buttons to the start and end
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: 1,
                            groupValue: waterconnection,
                            onChanged: (val) {
                              setState(() {
                                waterconnection = val!;
                              });
                            },
                          ),
                          const Text('आहे'),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 2,
                            groupValue: waterconnection,
                            onChanged: (val) {
                              setState(() {
                                waterconnection = val!;
                              });
                            },
                          ),
                          const Text('नाही'),
                        ],
                      ),
                    ],
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start, // Align the radio buttons to the start and end
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: 1,
                            groupValue: drainage,
                            onChanged: (val) {
                              setState(() {
                                drainage = val!;
                              });
                            },
                          ),
                          const Text('आहे'),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 2,
                            groupValue: drainage,
                            onChanged: (val) {
                              setState(() {
                                drainage = val!;
                              });
                            },
                          ),
                          const Text('नाही'),
                        ],
                      ),
                    ],
                  ),

                ],
              ),
            ),

            Row(
              children: [
                // Expanded(
                //   flex: 1,
                //   child: Padding(
                //     padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                //     child: ElevatedButton(
                //       onPressed: () {
                //         // Handle the first button's onPressed action
                //       },
                //       style: ElevatedButton.styleFrom(
                //         primary: Colors.red, // Set the button color to red
                //       ),
                //       child: const Text('रद'),
                //     ),
                //   ),
                // ),

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
                        primary: Colors.blueAccent, // Set the button color to green
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.save,size: 18,),
                          SizedBox(width: 4,),
                          const Text('सेव'),
                        ],
                      ),
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
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.arrow_forward,size: 18,),
                          SizedBox(width: 4,),
                          Text('पुढे'),
                        ],
                      ),
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
    for (int year = 1980; year <= currentYear; year++) {
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
