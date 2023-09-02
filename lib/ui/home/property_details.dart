import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:house_cleaning/ui/home/description.dart';
import 'package:house_cleaning/widgets/button_card.dart';
import 'package:house_cleaning/widgets/edittext.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:house_cleaning/ui helper/pop_up_dialogue.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
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

  var _selectedDate=DateTime.now();
  var zoneController=TextEditingController();
  var connectionController=TextEditingController();
  var numberController=TextEditingController();

  String _selectedDateString='इमरत वापर सुरु झाल्येचे आर्थिक वर्ष:';

  String buildingType='';

  String roadSize='';

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline_rounded),
            iconSize: 24, // Add your desired icon here
            onPressed: () {
              _showCloudyMessagePopup(context);
            },
          ),
        ],
        title: const Text("Details of your property"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GestureDetector(onTap: (){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Select Year"),
                          content: Container( // Need to use container to add size constraint.
                            width: 300,
                            height: 300,
                            child: YearPicker(
                              firstDate: DateTime(DateTime.now().year - 200, 1),
                              lastDate: DateTime(DateTime.now().year, 1),
                              initialDate: DateTime.now(),
                              // save the selected date to _selectedDate DateTime variable.
                              // It's used to set the previous selected date when
                              // re-showing the dialog.
                              selectedDate: _selectedDate,
                              onChanged: (DateTime dateTime) {
                                // close the dialog when year is selected.
                                Navigator.pop(context);

                                setState(() {
                                  _selectedDate=dateTime;
                                  _selectedDateString='इमरत वापर सुरु झाल्येचे आर्थिक वर्ष:'+ DateFormat("yyyy").format(_selectedDate);
                                });
                                // Do something with the dateTime selected.
                                // Remember that you need to use dateTime.year to get the year
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },child: Container(
                    height: 60,
                    margin: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color:Colors.black45),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 12,),
                        Icon(Icons.calendar_month,color: Colors.grey,),
                        SizedBox(width: 8,),
                        Text(_selectedDateString,style: TextStyle(color: Colors.black),),
                      ],
                    ),
                  )),

                  EditText(controller: zoneController, text: 'भाडे मुल्य झोन क्रमांक', icon: Icons.numbers,selected: true,),

                  Divider(thickness: 1,indent: 16,color: Colors.black12,endIndent: 16,),
                  Padding(
                    padding: const EdgeInsets.only(left: 16,top: 8,right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'इमारतीचे प्रत:', // Radio group title
                              style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),
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
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                          child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.add_road),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                ),
                                labelText: 'इमारतीचे प्रत:',
                              ),icon: Icon(Icons.arrow_drop_down_outlined),

                              items: [
                                DropdownMenuItem(value: 'प्रकार अ', child: Text('प्रकार अ',)),
                                DropdownMenuItem(value: 'प्रकार ब', child: Text('प्रकार ब')),
                                DropdownMenuItem(value: 'प्रकार क', child: Text('प्रकार क')),
                                DropdownMenuItem(value: 'प्रकार ड', child: Text('प्रकार ड')),
                                DropdownMenuItem(value: 'प्रकार इ', child: Text('प्रकार इ')),
                                DropdownMenuItem(value: 'प्रकार ई', child: Text('प्रकार ई')),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  buildingType=value!;
                                });
                              }  // Handle dropdown value change
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(thickness: 1,color: Colors.black12,indent: 16,endIndent: 16,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.add_road),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        contentPadding: EdgeInsets.all(16),
                        labelText: 'इमारत समोर रस्ता: ',
                      ),icon: Icon(Icons.arrow_drop_down_outlined),

                      items: [
                        DropdownMenuItem(value: '6 मीटर पर्यंत', child: Text('6 मीटर पर्यंत',)),
                        DropdownMenuItem(value: '6 ते 12 मीटर', child: Text('6 ते 12 मीटर')),
                        DropdownMenuItem(value: '12 ते 30 मीटर', child: Text('12 ते 30 मीटर')),
                        DropdownMenuItem(value: '30 मीटर पेक्षा अधिक', child: Text('30 मीटर पेक्षा अधिक')),
                      ],
                      onChanged: (value) {
                        setState(() {
                          roadSize=value!;
                        });
                      }  // Handle dropdown value change
                    ),
                  ),
                  Divider(indent: 16,thickness: 1,endIndent: 16,),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'रस्ता:', // Radio group title
                          style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),
                        ),
                        RadioListTile(
                          title: const Text('कच्चा'),
                          value: 1,
                          groupValue: roadRadio,
                          onChanged: (val) {
                            setState(() {
                              roadRadio=val!;
                            });
                            },
                        ),
                        RadioListTile(
                          title: const Text('पक्का'),
                          value: 2,
                          groupValue: roadRadio,
                          onChanged: (val) {
                            setState(() {
                              roadRadio=val!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),

                  Divider(indent: 16,thickness: 1,endIndent: 16,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'सांडपाण्याची व्‍यवस्‍था:', // Radio group title
                          style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),
                        ),
                        RadioListTile(
                          title: const Text('आहे'),
                          value: 1,
                          groupValue: sandpani,
                          onChanged: (val) {
                            setState(() {
                              sandpani=val!;
                            });
                            },
                        ),
                        RadioListTile(
                          title: const Text('नाही'),
                          value: 2,
                          groupValue: sandpani,
                          onChanged: (val) {
                            setState(() {
                              sandpani=val!;
                            });
                            },
                        ),
                      ],
                    ),
                  ),

                  Divider(indent: 16,thickness: 1,endIndent: 16,),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'पाणी कनेक्शन:', // Radio group title
                          style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),
                        ),
                        RadioListTile(
                          title: const Text('आहे'),
                          value: 1,
                          groupValue: waterconnection,
                          onChanged: (val) {
                            setState(() {
                              waterconnection=val!;
                            });
                            },
                        ),
                        RadioListTile(
                          title: const Text('नाही'),
                          value: 2,
                          groupValue: waterconnection,
                          onChanged: (val) {
                            setState(() {
                              waterconnection=val!;
                            });
                            },
                        ),
                      ],
                    ),
                  ),

                  Divider(indent: 16,thickness: 1,endIndent: 16,),

                  EditText(controller: connectionController, text: 'कनेक्शन धारकाचे नाव', icon: Icons.person, selected: false,),
                  EditText(controller: numberController, text: 'संडास संख्या', icon: Icons.bathtub,selected: false,),

                  Divider(indent: 16,endIndent: 16,),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'ड्रेनेज:', // Radio group title
                          style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),
                        ),
                        RadioListTile(
                          title: const Text('आहे'),
                          value: 1,
                          groupValue: drainage,
                          onChanged: (val) {
                            setState(() {
                              drainage=val!;
                            });
                            },
                        ),
                        RadioListTile(
                          title: const Text('नाही'),
                          value: 2,
                          groupValue: drainage,
                          onChanged: (val) {
                            setState(() {
                              drainage=val!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          ButtonsNav(onPressCancel: (){
          }, onPressSave: (){
            saveData();
          }, onPressNext: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>DescriptionPage()));
          }),
        ],
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


  Future<int> saveData() async{
    var url=Uri.parse('https://nagarpalika-erp-api.azurewebsites.net/api/UpdatePropertyDetails');
    final headers = {'Content-Type': 'application/json'};
    //todo body needs to be updated
    var body=jsonEncode({
      'assessment_Number':'12345',
      'building_Year': '${DateFormat("yyyy").format(_selectedDate)}',
      'rent_zone':zoneController.text.toString(),
      'building_type':buildingType,
      'road_size': roadSize,
      'road_type':roadRadio==0 ? 'कच्चा':'पक्का',
      'sewage_system':sandpani ==0 ? 'आहे':'नाही',
      'water_connection':waterconnection==0 ? 'आहे':'नाही',
      'water_connection_name':connectionController.text.toString(),
      'no_of_toilet':numberController.text.toString(),
      'drainage':drainage ==0 ? 'आहे':'नाही',
    });

    await http.put(url,headers: headers,body: body).then((value){
      print(value.body.toString());
      print(value.statusCode);
      return value.statusCode;
    });

    return 404;
  }
}
