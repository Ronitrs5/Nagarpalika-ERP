import 'package:flutter/material.dart';

class DescriptionPage extends StatefulWidget {
  const DescriptionPage({super.key});

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text("Description"),
          backgroundColor: Colors.blueAccent,
        ),

      body:  SingleChildScrollView(
         child: Column(
            children: [
               const Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Text(
                  "मालकाचे अगर वहिवाटदाराचे वापरातील जगेचे वर्णन",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    labelText: 'खोली प्रकार ',
                  ),
                  items: const [
                    DropdownMenuItem<String>(
                      value: 'मालका',
                      child: Text('मालका'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'भाडेकर',
                      child: Text('भाडेकर'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'भोगवतदार',
                      child: Text('भोगवतदार'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'अन्य',
                      child: Text('अन्य'),
                    ),
                  ],
                  onChanged: (value) {
                    // Handle the selected value
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    labelText: 'मालकाचे, भाडेकरूचे/भोगवतदाराचे नाव',
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    labelText: 'वापराचा प्राकार',
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 8, 16),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 1.0),
                          ),
                          labelText: 'खोलीची रुंदी',
                        ),
                      ),
                    ),
                  ),

                  const Text(
                    'x',
                    style: TextStyle(fontSize: 24), // Adjust the font size as needed
                  ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 1.0),
                          ),
                          labelText: 'खोलीची लांबी',
                        ),
                      ),
                    ),
                  ),

                  const Text(
                    '=',
                    style: TextStyle(fontSize: 24), // Adjust the font size as needed
                  ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 16, 16),
                      child: Center(
                        child: TextFormField(
                          enabled: false,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey, width: 1.0),
                            ),
                            labelText: 'एकुण क्षेत्र',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Center(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      labelText: 'प्रत्यक्ष मासिक भाडे',
                    ),
                  ),
                ),
              ),

              const Divider(color: Colors.black,
              indent: 8,
              endIndent: 8,),

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
                          primary: Colors.green, // Set the button color to green
                        ),
                        child: const Text('सेव आणि सबमिट'),
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
}
