import 'package:flutter/material.dart';
import 'package:house_cleaning/ui/home/property_details.dart';
import 'package:house_cleaning/ui helper/pop_up_dialogue.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class NewRegistrationPage extends StatefulWidget {
  const NewRegistrationPage({Key? key}) : super(key: key);

  @override
  State<NewRegistrationPage> createState() => _NewRegistrationPageState();
}

class _NewRegistrationPageState extends State<NewRegistrationPage> {

  String address='';
  TextEditingController _latitudeController = TextEditingController();
  TextEditingController _longitudeController = TextEditingController();

  TextEditingController _addressController = TextEditingController();

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

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
    return await Geolocator.getCurrentPosition();
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

            Padding(
              padding: const EdgeInsets.fromLTRB(35, 5, 35, 0),
              child: TextFormField(
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

            const Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 35, 0),
              child: Text(
                "स्थान कॅप्चर:",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent,
                  ),
                  onPressed: () async{

                    Position position= await _determinePosition();
                    GetAddress(position);
                    setState(() {
                      _latitudeController.text = position.latitude.toString();
                      _longitudeController.text = position.longitude.toString();
                    });
                  },
                  child: Text('Get house location'),
                ),
              ],
            ),

            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 35,
                    child: TextFormField(
                      controller: _latitudeController,
                      enabled: false,
                      decoration: InputDecoration(
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
                        decoration: InputDecoration(
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
                      // Handle the first button's onPressed action
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red, // Set the button color to red
                    ),
                    child: const Text('रद'),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      // Handle the second button's onPressed action
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey, // Set the button color to green
                    ),
                    child: const Text('सेव'),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      // Handle the second button's onPressed action
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
}

