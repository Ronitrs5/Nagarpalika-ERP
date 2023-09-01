import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:house_cleaning/ui helper/pop_up_dialogue.dart';
import 'package:http/http.dart' as http;

import '../../widgets/edittext.dart';


class WasteCollectionPage extends StatefulWidget {
  const WasteCollectionPage({super.key});

  @override
  State<WasteCollectionPage> createState() => _WasteCollectionPageState();
}

class _WasteCollectionPageState extends State<WasteCollectionPage> {

  var assesmentNumber=TextEditingController();
  var ownerName=TextEditingController();

  int selectedRadioButton = 0;
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

  void trashInstruction(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PopUpDialogue(
          title: 'सूचना',
          message: "1. कचरा घेताना सर्व महिती बरोबर आहे का नाही चेक करा\n\n2. कचर्याचे प्रकार खलील तिन्ही पैकी बरोबर निवड करा",
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
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      child:
                      Image.asset('assets/icon_qr.png',width: 100, color: Colors.blueGrey, ),
                    onTap: qrScanner,
                  ),

                ],
              ),
            ),

            Text("Press to scan",
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),),

            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(height: 25, color: Colors.black38),
            ),

            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Text(
                    "घराची महिती",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),

            EditText(controller: assesmentNumber, text: 'असेसमेंट नंबर', icon: Icons.numbers, selected: true,),
            EditText(controller: assesmentNumber, text: 'मालकाचे नाव', icon: Icons.person, selected: true,),

            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(height: 25, color: Colors.black38),
            ),

             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Text(
                    "आजच्या कचऱ्याचे प्रकार",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                GestureDetector(
                  onTap:(){
                    trashInstruction(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
                    child: Icon(Icons.info_outline_rounded),
                  ),
                )
              ],
            ),

            Column(
              children: [
                RadioListTile(

                  title: const Text('ओला वेगळा, सुका वेगळा',style: TextStyle(fontSize: 14),),
                  value: 1,
                  groupValue: selectedRadioButton,
                  onChanged: (val) {
                    setSelectedRadio(1);
                  },
                ),
                RadioListTile(
                  title: const Text('ओला सुका मिक्स',style: TextStyle(fontSize: 14),),
                  value: 2,
                  groupValue: selectedRadioButton,
                  onChanged: (val) {
                    setSelectedRadio(2);
                  },
                ),

                RadioListTile(
                  title: const Text('इलेक्ट्रिक',style: TextStyle(fontSize: 14),),
                  value: 3,
                  groupValue: selectedRadioButton,
                  onChanged: (val) {
                    setSelectedRadio(3);
                  },
                ),

              ],
            ),

            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(height: 25, color: Colors.black38),
            ),

            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 8, 16),
                    child: ElevatedButton(
                      onPressed: () {

                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red, 
                        padding: EdgeInsets.all(8)// Set the button color to red
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.no_accounts,size: 20,),
                          Text('Waste not collected',style: TextStyle(fontSize: 12,),textAlign: TextAlign.center,),
                        ],
                      ),
                    ),
                  ),
                ),

                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 16, 16),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green, // Set the button color to green
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.check),
                          SizedBox(width: 8,),
                          Text('Waste collected',style: TextStyle(fontSize: 12,),textAlign: TextAlign.center,),
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

  Future<int> collect() async{
    var url=Uri.parse('https://nagarpalika-erp-api.azurewebsites.net/api/WasteCollection/AddWasteCollection');
    final headers = {'Content-Type': 'application/json'};
    //todo body needs to be updated
    var body=jsonEncode({
      '':'',
    });
    
    await http.post(url,headers: headers,body: body).then((value){
      return value.statusCode;
    });

    return 404;
  }
  void _showSnackbar(BuildContext context, String? data) {
    String? d= data;
    String d2= d??"";
    final snackBar = SnackBar(
      content: Text("This is what was scanned:\n"+d2),
      duration: const Duration(seconds: 10), // Adjust the duration as needed.
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
