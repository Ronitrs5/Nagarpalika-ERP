
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:house_cleaning/ui/home/maps.dart';
import 'package:house_cleaning/ui/home/property_details.dart';
import 'package:house_cleaning/ui helper/pop_up_dialogue.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


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

  bool _isLoading = false;

  Position? currentUserPosition;
  String address='';
  final TextEditingController _latitudeController = TextEditingController();
  final TextEditingController _longitudeController = TextEditingController();
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

  @override
  void initState() {
    super.initState();
    // Fetch user details using API call and update userDetails
    _fetchUserDetails();
  }

  Future<void> _fetchUserDetails() async {
    final url = Uri.parse('https://nagarpalika-erp-api.azurewebsites.net/api/Properties');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List<dynamic>;

      if (data.isNotEmpty) {
        final firstItem = data[0]; // Assuming you want data from the first item

        setState(() {
          c1.text = firstItem['assessment_Number'];
          c2.text = firstItem['ccN_RCN_GutNo'];
          c3.text = firstItem['ward_No'];
          c4.text = firstItem['house_No'];
          c5.text = firstItem['owner_Name'];
          c6.text = firstItem['mobile_Number'];
          c7.text = firstItem['telephone_Number'];
          c8.text = firstItem['area_Name'];
          c9.text = firstItem['plot_Area'];
          // ... and so on
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

      body: SingleChildScrollView(

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Text(
                "Reg. No. ",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Text(userDetails),

            Padding(
              padding: const EdgeInsets.fromLTRB(35, 5, 35, 0),
              child: TextFormField(
                controller: c1,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.confirmation_number_outlined),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  labelText: 'नोंदणी क्रमांक',
                ),
              ),
            ),

            const Divider(height: 25,
            color: Colors.black38,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),

            const Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 35, 0),
              child: Text(
                "सर्व अवश्यक",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(35, 5, 35, 0),
              child: TextFormField(
                controller: c2,
                decoration: const InputDecoration(
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
                controller: c3,
                decoration: const InputDecoration(
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
                controller: c4,
                decoration: const InputDecoration(
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
                controller: c5,
                decoration: const InputDecoration(
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
                controller: c6,
                keyboardType: TextInputType.phone, // Set keyboard type to phone number
                decoration: const InputDecoration(
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
                controller: c7,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
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
                controller: c8,
                decoration: const InputDecoration(
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
                controller: c9,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.place),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  labelText: 'जागा क्षेत्र',
                ),
              ),
            ),

            const Divider(height: 25,
              color: Colors.black38,
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
                      fontSize: 20,
                    ),
                  ),
                ),

                GestureDetector(
                  onTap:(){
                    locationInfo(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
                    child: Icon(Icons.info_outline_rounded),
                  ),
                )
              ],
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  Column(children: [
                    Center(
                      child: InkWell(
                        onTap: () async {
                                  setState(() {
                                  _isLoading=true;
                                  });

                                  Position position= await _determinePosition();
                                  GetAddress(position);
                                  setState(() {
                                    _latitudeController.text = position.latitude.toString();
                                    _longitudeController.text = position.longitude.toString();
                                    _isLoading=false;

                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Location fetched!')));

                                  });
                                },
                        child: _isLoading? CircularProgressIndicator(color: Colors.blueAccent,) : Image.asset(
                          'assets/icon_moblocation.png', // Replace with your image asset path
                          width: 50, // Set the width of the image
                          height: 50, // Set the height of the image
                          fit: BoxFit.cover, // Fit the image within the button bounds
                        ),
                      ),
                    ),

                    if(_isLoading)
                      const Text(
                        "Getting location..",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    if(_isLoading == false)
                    const Text(
                      "Device's\nLocation",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                  ),

                  Text("OR"),
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
                        child: Image.asset(
                          'assets/icon_maps.png', // Replace with your image asset path
                          width: 50, // Set the width of the image
                          height: 50, // Set the height of the image
                          fit: BoxFit.cover, // Fit the image within the button bounds
                        ),
                      ),
                    ),

                    const Center(
                      child: Text(
                        "Map\n(Recommended)",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],),
                ],),
            ),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     // ElevatedButton(
            //     //   style: ElevatedButton.styleFrom(
            //     //     primary: Colors.blueAccent,
            //     //   ),
            //     //   onPressed: () async{
            //     //     Position position= await _determinePosition();
            //     //     GetAddress(position);
            //     //     setState(() {
            //     //       _latitudeController.text = position.latitude.toString();
            //     //       _longitudeController.text = position.longitude.toString();
            //     //     });
            //     //   },
            //     //   child: const Text('Get house location'),
            //     // ),
            //   ],
            // ),

            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 35,
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 35,
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

            Padding(
              padding: const EdgeInsets.fromLTRB(30, 1, 30, 20),
              child: TextFormField(
                controller: _addressController,
                enabled: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  labelText: 'Address',
                ),
              ),
            ),

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


            const Divider(height: 10 ,
              color: Colors.black38,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),


            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,

                children: [
                  ElevatedButton(
                    onPressed: () {
                      clearAllFields();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red, // Set the button color to red
                    ),
                    child: const Text('रद्द'),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      final newLatitude = _latitudeController.text;
                      final newLongitude = _longitudeController.text;

                      final newC1= c1.text;
                      final newC2= c2.text;
                      final newC3= c3.text;
                      final newC4= c4.text;
                      final newC5= c5.text;
                      final newC6= c6.text;
                      final newC7= c7.text;
                      final newC8= c8.text;
                      final newC9= c9.text;

                      updateUserDetails(newC1, newC2, newC3, newC4, newC5, newC6, newC7, newC8, newC9);
                      // updateLocation(newLatitude, newLongitude);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey, // Set the button color to green
                    ),
                    child:  Text("सेव"),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const PropertyDetails()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green, // Set the button color to green
                    ),
                    child: const Text('पुढे'),
                  ),

                ],
              ),
            ),
            
          ],
        ),
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
          message: "You can select location using 2 methods:\nA. Your device's current location.\nB. Using a marker on Google Maps.\n\n"
              "Note: If your are getting inaccurate location using method A, then please use method B.\n\n"
              "Wrong locations won't be tolerated!",
        );
      },
    );
  }

  Future<void> updateLocation(String newLatitude, String newLongitude) async {
    final url = Uri.parse('https://nagarpalika-erp-api.azurewebsites.net/api/UpdatePropertyLocation');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'latitude': newLatitude,
      'longitude': newLongitude,
    });

    print('Sending data: $body');

    final response = await http.put(
      url,
      headers: headers,
      body: body,
    );

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
      'assessment_Number': newC1,
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
        'assessment_Number': newC1,
        'ccN_RCN_GutNo': newC2,
        'ward_No': newC3,
        'house_No': newC4,
        'owner_Name': newC5,
        'mobile_Number': newC6,
        'telephone_Number': newC7,
        'area_Name': newC8,
        'plot_Area': newC9,
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
      final errorMessage = 'Error updating user details. Status Code: ${response.statusCode}, Response Body: ${response.body}';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    }

  }
}