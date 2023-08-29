import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:house_cleaning/ui helper/pop_up_dialogue.dart';


class WasteCollectionPage extends StatefulWidget {
  const WasteCollectionPage({super.key});

  @override
  State<WasteCollectionPage> createState() => _WasteCollectionPageState();
}

class _WasteCollectionPageState extends State<WasteCollectionPage> {

  int selectedRadioButton = 0; // Track the selected radio button
  setSelectedRadio(int val) {
    setState(() {
      selectedRadioButton = val;
    });
  }

  Future<void> qrScanner() async{

    var camPermission= await Permission.camera.status;
    if(camPermission.isGranted){
    String? qrdata= await scanner.scan();
    _showSnackbar(context, qrdata);
    }
    else{
      var isGranted= await Permission.camera.request();
    }

  }
  void _showCloudyMessagePopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PopUpDialogue(
          title: 'सूचना',
          message: "1. पहिले SCAN करा\n\n2. असेसमेंट नंबर आणि मालकाचे\nनाव AUTOMATIC येइल\n\n3. कोणता प्रकारचे कचरा\nआहे ते SELECT करा\n\n4. कचरा घेतल्यास GREEN बटण\nदाबा अन्यथा RED बटण दाबा",
        );
      },
    );
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
              // Navigator.push(context, MaterialPageRoute(builder: (context)=>const DescriptionPage()));
              _showCloudyMessagePopup(context);
            },
          ),
        ],
        title: const Text("Waste Collection"),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Text(
                    "1. स्कॅन",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),

            Builder(
                builder: (context)=>Container(
                  alignment: Alignment.center,
                  child: Flex(
                    direction: Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      ElevatedButton(onPressed: (){
                        qrScanner();
                      },
                          child: const Text("स्कॅन करा"))
                    ],
                  ),
            )
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(height: 25, color: Colors.black38),
            ),

            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Text(
                    "2. घराची महिती",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: TextFormField(
                enabled: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  labelText: 'असेसमेंट नंबर',
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: TextFormField(
                enabled: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  labelText: 'मालकाचे नाव',
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(height: 25, color: Colors.black38),
            ),

            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Text(
                    "3. आजच्या कचर्याचे प्रकार",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),

            Column(
              children: [
                RadioListTile(

                  title: const Text('ओला वेगळा, सुका वेगळा'),
                  value: 1,
                  groupValue: selectedRadioButton,
                  onChanged: (val) {
                    setSelectedRadio(1);
                  },
                ),
                RadioListTile(
                  title: const Text('ओला सुका मिक्स'),
                  value: 2,
                  groupValue: selectedRadioButton,
                  onChanged: (val) {
                    setSelectedRadio(2);
                  },
                ),

                RadioListTile(
                  title: const Text('इलेक्ट्रिक'),
                  value: 3,
                  groupValue: selectedRadioButton,
                  onChanged: (val) {
                    setSelectedRadio(3);
                  },
                ),

              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(height: 25, color: Colors.black38),
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
                      child: const Text('Waste no collected'),
                    ),
                  ),
                ),

                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green, // Set the button color to green
                      ),
                      child: const Text('Waste collected'),
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

  void _showSnackbar(BuildContext context, String? data) {
    String? d= data;
    String d2= d??"";
    final snackBar = SnackBar(
      content: Text("This is what was scanned:\n"+d2),
      duration: Duration(seconds: 10), // Adjust the duration as needed.
      action: SnackBarAction(
        label: 'Dismiss',
        onPressed: () {
          // You can define an action to be performed when the action button is clicked.
        },
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
