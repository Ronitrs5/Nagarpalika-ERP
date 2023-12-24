import 'dart:convert';

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

  int selectedRadioButton10 = 0;

  bool hasInput = true; // Track whether input is present or not
  TextStyle _textStyle = TextStyle(fontSize: 16, color: Colors.black87, );

  @override
  void initState() {
    super.initState();
    assesmentNumber.addListener(_handleTextChange);
    ownerName.addListener(_handleTextChange);

  }

  void _handleTextChange() {
    setState(() {
      hasInput = assesmentNumber.text.isNotEmpty;
      hasInput = ownerName.text.isNotEmpty;
      _textStyle = TextStyle(
        fontSize: 16,
        color: hasInput ? Colors.black : Colors.grey, // Change color based on input presence
        fontWeight: hasInput ? FontWeight.bold : FontWeight.normal,
      );
    });
  }

  bool isLoading=false;
  setSelectedRadio(int val) {
    setState(() {
      selectedRadioButton10 = val;
    });
  }

  Future<void> qrScanner() async{

    var camPermission= await Permission.camera.status;
    if(camPermission.isGranted){
    String? qrdata= await scanner.scan();
    if(qrdata!=null) {

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('QR scanned successfully')));
     assesmentNumber.text=qrdata.split("|")[0];
     ownerName.text=qrdata.split("|")[1];
    }else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Failed to scan QR'),backgroundColor: Colors.red,));
    }
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
                      onTap: qrScanner,
                      child:
                      Image.asset('assets/icon_qr.png',width: 100, color: Colors.blueGrey, ),
                  ),

                ],
              ),
            ),

            const Text("Press to scan",
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

            // EditText(controller: assesmentNumber, text: 'असेसमेंट नंबर', icon: Icons.numbers, selected: false,),
            // EditText(controller: ownerName, text: 'मालकाचे नाव', icon: Icons.person, selected: false,),

            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: TextFormField(
                enabled: false,
                controller: assesmentNumber,
                style: _textStyle,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.numbers_rounded),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey, width: 1,),
                      borderRadius: BorderRadius.circular(8)
                  ),
                  // label: Text("नोंदणी क्रमांक"),
                  label: Text('असेसमेंट नंबर',),
                  alignLabelWithHint: true,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: TextFormField(
                enabled: false,
                controller: ownerName,
                style: _textStyle,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey, width: 1,),
                      borderRadius: BorderRadius.circular(8)
                  ),
                  // label: Text("नोंदणी क्रमांक"),
                  label: Text('मालकाचे नाव',),
                  alignLabelWithHint: true,
                ),
              ),
            ),



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
                  groupValue: selectedRadioButton10,
                  onChanged: (val) {
                    setSelectedRadio(1);
                  },
                ),
                RadioListTile(
                  title: const Text('ओला सुका मिक्स',style: TextStyle(fontSize: 14),),
                  value: 2,
                  groupValue: selectedRadioButton10,
                  onChanged: (val) {
                    setSelectedRadio(2);
                  },
                ),

                RadioListTile(
                  title: const Text('इलेक्ट्रिक',style: TextStyle(fontSize: 14),),
                  value: 3,
                  groupValue: selectedRadioButton10,
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
                        padding: const EdgeInsets.all(8)// Set the button color to red
                      ),
                      child: const Row(
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
                      onPressed: () {

                        if(assesmentNumber.text.isEmpty){
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Please scan QR first'), backgroundColor: Colors.red,));
                        }

                        else if(selectedRadioButton10==0){
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Please collect waste type'), backgroundColor: Colors.red,));
                        }
                        else {
                          collect();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green, // Set the button color to green
                      ),
                      child: isLoading
                          ? const SizedBox(
                        width: 24,
                        height: 24,
                          child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                          : const Row(
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
    setState(() {
      isLoading=true;
    });
    var url=Uri.parse('https://nagarpalika-erp-api.azurewebsites.net/api/WasteCollection/AddWasteCollection');
    final headers = {'Content-Type': 'application/json'};
    //todo body needs to be updated
    var body=jsonEncode({
      'Assessment_Number':assesmentNumber.text,
      'userid':ownerName.text,
      'WasteType': selectedRadioButton10==1 ? 'ओला वेगळा, सुका वेगळा' : selectedRadioButton10==2 ? 'ओला सुका मिक्स' : selectedRadioButton10==3 ? 'इलेक्ट्रिक' : ''
    });
    
    await http.post(url,headers: headers,body: body).then((value){
      print(value.body);
      setState(() {
        isLoading=false;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Data uploaded successfully')));

      });
      return value.statusCode;
    });

    return 404;
  }
}
