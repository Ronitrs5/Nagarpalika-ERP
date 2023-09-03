
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:house_cleaning/ui/home/maps.dart';
import 'package:house_cleaning/ui/home/property_details.dart';
import 'package:house_cleaning/ui helper/pop_up_dialogue.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../widgets/edittext.dart';


var mainLatitude;
var mainLongitude;

class NewRegistrationPage extends StatefulWidget {
  const NewRegistrationPage({Key? key}) : super(key: key);


  @override
  State<NewRegistrationPage> createState() => _NewRegistrationPageState();
}

class _NewRegistrationPageState extends State<NewRegistrationPage> {

  final String assessmentId='';
  String userDetails = '';
  bool isButtonEnabled = false;
  bool _isLoading = false;
  @override




  Position? currentUserPosition;
  String address='';
  TextEditingController _latitudeController = TextEditingController();
  TextEditingController _longitudeController = TextEditingController();
  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();
  TextEditingController c3 = TextEditingController();
  TextEditingController c4 = TextEditingController();
  TextEditingController c5 = TextEditingController();
  TextEditingController c6 = TextEditingController();
  TextEditingController c7 = TextEditingController();
  TextEditingController c8 = TextEditingController();
  TextEditingController c9 = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  bool isLoading=false;
  @override
  void initState() {
    super.initState();
    // Fetch user details using API call and update userDetails
    _latitudeController.addListener(() {
      _updateButtonState();
    });

    _longitudeController.addListener(() {
      _updateButtonState();
    });
    _fetchUserDetails();
  }

  void _updateButtonState() {
    setState(() {
      isButtonEnabled = _latitudeController.text.isNotEmpty && _longitudeController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _latitudeController.dispose();
    _longitudeController.dispose();
    super.dispose();
  }

  Future<void> _fetchUserDetails() async {
    final url = Uri.parse('https://nagarpalika-erp-api.azurewebsites.net/api/Properties');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List<dynamic>;

      if (data.isNotEmpty) {
        final firstItem = data[0]; // Assuming you want data from the first item

        setState(() {
          c1.text = (firstItem['assessment_Number'] as String).trim();
          c2.text = (firstItem['ccN_RCN_GutNo'] as String).trim();
          c3.text = (firstItem['ward_No'] as String).trim();
          c4.text = (firstItem['house_No'] as String).trim();
          c5.text = (firstItem['owner_Name'] as String).trim();
          c6.text = (firstItem['mobile_Number'] as String).trim();
          c7.text = (firstItem['telephone_Number'] as String).trim();
          c8.text = (firstItem['area_Name'] as String).trim();
          c9.text = (firstItem['plot_Area'] as String).trim();
            // _latitudeController.text = (firstItem['latitude'] as String?) ?? '';
            // _longitudeController.text = (firstItem['longitude'] as String?) ?? '';

        });
      }
    } else {
      // Handle error
    }
  }


  // @override
  // void initState() {
  //   super.initState();
  //   // Fetch user details using API call and update userDetails
  //   _fetchUserDetails();
  // }
  //
  // Future<void> _fetchUserDetails() async {
  //   final url = Uri.parse('https://nagarpalika-erp-api.azurewebsites.net/api/Properties');
  //   final response = await http.get(url);
  //
  //   if (response.statusCode == 200) {
  //     // Parse response and update userDetails
  //     setState(() {
  //       userDetails = response.body; // You can parse JSON here
  //     });
  //   } else {
  //     // Handle error
  //   }
  // }

  void clearAllFields() {
    c1.clear();
    c2.clear();
    c3.clear();
    c4.clear();
    c5.clear();
    c6.clear();
    c7.clear();
    c8.clear();
    c9.clear();
    _latitudeController.clear();
    _longitudeController.clear();
    _addressController.clear();
  }


  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // if (!serviceEnabled) {
    //   await Geolocator.openLocationSettings();
    //   return Future.error('Location services are disabled.');
    // }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
  }

  Future<void> getPosForMap() async {
    // ... Existing code ...

    currentUserPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
  }

  Future<void> GetAddress(Position position) async{
    List<Placemark> placemark= await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place= placemark[0];

    address= '${place.name}, ${place.subLocality}, ${place.locality}- ${place.postalCode}, ${place.administrativeArea}, ${place.country}';

    setState(() {
      _addressController.text = address.toString();
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
              // Add your icon button logic here
              _showCloudyMessagePopup(context);
            },
          ),
        ],
        title: const Text("New Registration"),
        backgroundColor: Colors.blueAccent,
      ),

      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 16, 8, 0),
                    child: Text(
                      "Reg. No. ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Text(userDetails),

                  EditText(controller: c1,text: "नोंदणी क्रमांक",icon: Icons.app_registration,selected: false, ),
                  //
                  // Padding(
                  //   padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  //   child: TextFormField(
                  //     enabled: false,
                  //     controller: c1,
                  //     decoration: const InputDecoration(
                  //       border: OutlineInputBorder(
                  //         borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  //       ),
                  //       labelText: "नोंदणी क्रमांक",
                  //     ),
                  //   ),
                  // ),

                  const Divider(height: 25,
                  color: Colors.black12,
                    thickness: 1,
                    indent: 16,
                    endIndent: 10,
                  ),


                  const Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 35, 0),
                    child: Text(
                      "सर्व अवश्यक",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  const SizedBox(height: 16,),

                  EditText(controller: c2, text: 'सि.सि.नं./ रि.सि.नं./ गट नं.', icon: Icons.grid_on_outlined, selected: false),
                  EditText(controller: c3, text: 'वार्ड नं.', icon: Icons.streetview, selected: false),
                  EditText(controller: c4, text: 'घर नं.', icon: Icons.house, selected: false),
                  EditText(controller: c5, text: 'मालमता धारकाचे नाव.', icon: Icons.person, selected: false),
                  EditText(controller: c6, text: 'मोबाईल नं.', icon: Icons.phone_android, selected: true),
                  EditText(controller: c7, text: 'टेलिफोन नं.', icon: Icons.phone, selected: true),
                  EditText(controller: c8, text: 'परिसराचे नाव', icon: Icons.place, selected: false),
                  EditText(controller: c9, text: 'जागा क्षेत्र', icon: Icons.area_chart, selected: false),

                  const Divider(height: 25,
                    color: Colors.black26,
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Text(
                          "लोकेशन",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap:(){
                          locationInfo(context);
                        },
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
                          child: Icon(Icons.info_outline_rounded,size: 20,weight: 1200,),
                        ),
                      )
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        // Column(children: [
                        //   Center(
                        //     child: InkWell(
                        //       onTap: () async {
                        //                 setState(() {
                        //                 _isLoading=true;
                        //                 });
                        //
                        //                 Position position= await _determinePosition();
                        //                 GetAddress(position);
                        //                 setState(() {
                        //                   _latitudeController.text = position.latitude.toString();
                        //                   _longitudeController.text = position.longitude.toString();
                        //                   _isLoading=false;
                        //
                        //                   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Location fetched!')));
                        //
                        //                 });
                        //               },
                        //       child: _isLoading? const CircularProgressIndicator(color: Colors.blueAccent,) : Container(
                        //         decoration: BoxDecoration(
                        //           color: Colors.black12,
                        //           borderRadius: BorderRadius.circular(70)
                        //         ),
                        //         padding: const EdgeInsets.all(16),
                        //
                        //         child: Image.asset(
                        //           'assets/icon_moblocation.png', // Replace with your image asset path
                        //           width: 35, // Set the width of the image
                        //           height: 35, // Set the height of the image
                        //           fit: BoxFit.cover, // Fit the image within the button bounds
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        //
                        //   if(_isLoading)
                        //     const Text(
                        //       "Getting location..",
                        //       style: TextStyle(
                        //         fontSize: 16,
                        //       ),
                        //       textAlign: TextAlign.center,
                        //     ),
                        //   if(_isLoading == false)
                        //   const Padding(
                        //     padding: EdgeInsets.only(top: 8.0),
                        //     child: Text(
                        //       "Device's\nLocation",
                        //       style: TextStyle(
                        //         fontSize: 14,
                        //       ),
                        //       textAlign: TextAlign.center,
                        //     ),
                        //   ),
                        // ],
                        // ),

                        // const Text("OR",style: TextStyle(fontWeight: FontWeight.bold),),

                        Column(children: [
                          Center(
                            child: InkWell(
                              onTap: () async {
                                final selectedLatLng = await Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => MyMap()),
                                );

                                if (selectedLatLng != null) {
                                  setState(() {
                                    // Update lat and lon in the registration page's state
                                    _latitudeController.text = selectedLatLng.latitude.toString();
                                    _longitudeController.text = selectedLatLng.longitude.toString();
                                  });
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(70)
                                ),
                                padding: const EdgeInsets.all(16),
                                child: Image.asset(
                                  'assets/icon_maps.png', // Replace with your image asset path
                                  width: 35, // Set the width of the image
                                  height: 35, // Set the height of the image
                                  fit: BoxFit.cover, // Fit the image within the button bounds
                                ),
                              ),
                            ),
                          ),

                          const Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Text(
                                "Select Location\nUsing Map",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],),
                      ],),
                  ),

                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _latitudeController,
                            enabled: false,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 1.0),
                              ),
                              labelText: 'Latitude',
                            ),
                          ),
                        ),
                        const SizedBox(width: 8,),
                        Expanded(
                          child: TextFormField(
                            enabled: false,
                              controller: _longitudeController,
                              decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 1.0),
                              ),
                              labelText: 'Longitude',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.fromLTRB(30, 1, 30, 20),
                  //   child: TextFormField(
                  //     controller: _addressController,
                  //     enabled: false,
                  //     decoration: const InputDecoration(
                  //       border: OutlineInputBorder(
                  //         borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  //       ),
                  //       labelText: 'Address',
                  //     ),
                  //   ),
                  // ),

                  //
                  // ElevatedButton(
                  //   onPressed: () async {
                  //     final selectedLatLng = await Navigator.push(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => MyMap()),
                  //     );
                  //
                  //     if (selectedLatLng != null) {
                  //       setState(() {
                  //         // Update lat and lon in the registration page's state
                  //         _latitudeController.text = selectedLatLng.latitude.toString();
                  //         _longitudeController.text = selectedLatLng.longitude.toString();
                  //       });
                  //     }
                  //   },
                  //   child: const Text('Open Maps Activity'),
                  // ),
                  
                ],
              ),
            ),
          ),
          Card(
            elevation: 20,
            margin: EdgeInsets.zero,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Expanded(
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //       clearAllFields();
                  //     },
                  //     style: ElevatedButton.styleFrom(
                  //         primary: Colors.red,
                  //         padding: const EdgeInsets.all(14), // Set the button color to red
                  //     ),
                  //     child: const Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         Icon(Icons.cancel,size: 18,),
                  //         SizedBox(width: 4,),
                  //         Text('रद्द',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(width: 8,),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        final newLatitude = _latitudeController.text;
                        final newLongitude = _longitudeController.text;
                        final newC1= c1.text.trim();
                        final newC2= c2.text.trim();
                        final newC3= c3.text.trim();
                        final newC4= c4.text.trim();
                        final newC5= c5.text.trim();
                        final newC6= c6.text.trim();
                        final newC7= c7.text.trim();
                        final newC8= c8.text.trim();
                        final newC9= c9.text.trim();

                        // updateUserDetails(newC1, newC2, newC3, newC4, newC5, newC6, newC7, newC8, newC9);
                        updateLocation(newC1, newLatitude, newLongitude);
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blueAccent, // Set the button color to green
                          padding: const EdgeInsets.all(14)// Set the button color to red
                      ),
                      child:  isLoading
                          ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                        ),
                      )
                          : const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.save,size: 18,),
                          SizedBox(width: 4,),
                          Text("सेव"),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8,),
                  Expanded(
                    // child: ElevatedButton(
                    //   onPressed: () {
                    //     Navigator.push(context, MaterialPageRoute(builder: (context)=>const PropertyDetails()));
                    //   },
                    //   style: ElevatedButton.styleFrom(
                    //       primary: Colors.green, // Set the button color to green
                    //       padding: const EdgeInsets.all(14)// Set the button color to red
                    //   ),
                    //   child: const Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Icon(Icons.arrow_forward,size: 18,),
                    //       SizedBox(width: 4,),
                    //       Text('पुढे'),
                    //     ],
                    //   ),
                    // ),
                    child:
                    ElevatedButton(
                      onPressed: isButtonEnabled
                          ? () {
                        // Navigate to the next page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PropertyDetails(),
                          ),
                        );
                      }
                          : null,
                      style: ElevatedButton.styleFrom(
                              primary: Colors.green, // Set the button color to green
                              padding: const EdgeInsets.all(14)// Set the button color to red
                          ), // Disable the button if inputs are empty
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

                ],
              ),
            ),
          ),

        ],
      ),
    );
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

  void _updateSelectedLocation(LatLng latLng) {
    setState(() {
      _latitudeController.text = latLng.latitude.toString();
      _longitudeController.text = latLng.longitude.toString();
    });

    // Reverse geocode to get the address for the selected location if needed.
  }

  void locationInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PopUpDialogue(
          title: 'Disclaimer',
          message: "1. Give the required permissions and turn on LOCATION.\n\n"
              "2. Navigate the RED marker to the exact location of your house.\n\n"
              "3. You can see the SATELLITE view by pressing the green button on the top right of maps.\n\n"
              "4. Press on 'Select this location' for getting the coordinates.",

        );
      },
    );
  }

  Future<void> updateLocation(String newC1, String newLatitude, String newLongitude) async {
    setState(() {
      isLoading=true;
    });
    final url = Uri.parse('https://nagarpalika-erp-api.azurewebsites.net/api/UpdatePropertyLocation');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'Assessment_Number': newC1,
      'latitude': newLatitude,
      'longitude': newLongitude,
    });
    print('Sending data: $body');

    final response = await http.put(
      url,
      headers: headers,
      body: body,
    ).then((value){
      setState(() {
        isLoading=false;
      });
    });

    print('Response status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Location updated successfully')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error updating location')),
      );
    }
  }


  Future<void> updateUserDetails(String newC1, String newC2, String newC3, String newC4, String newC5,
      String newC6, String newC7, String newC8, String newC9) async {
    final url = Uri.parse('https://nagarpalika-erp-api.azurewebsites.net/api/UpdatePropertyDetails');

    print('Sending data: ${jsonEncode({
      'Assessment_Number': newC1,
      'ccN_RCN_GutNo': newC2,
      'ward_No': newC3,
      'house_No': newC4,
      'owner_Name': newC5,
      'mobile_Number': newC6,
      'telephone_Number': newC7,
      'area_Name': newC8,
      'plot_Area': newC9,
      'Result': '',
    })}');

    final response = await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'Assessment_Number': newC1,
        'ccN_RCN_GutNo': newC2,
        'Ward_No': newC3,
        'House_No': newC4,
        'Owner_Name': newC5,
        'Mobile_Number': newC6,
        'Telephone_Number': newC7,
        'Area_Name': newC8,
        'Plot_Area': newC9,
        'Result': '',
      }),
    );
    print('Response status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User details updated successfully')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error updating user details')),
      );
    }
  }
}