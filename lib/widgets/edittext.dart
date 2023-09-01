import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditText extends StatelessWidget {
  const EditText({Key? key, required this.controller,required this.text, required this.icon, required this.selected}) : super(key: key);

  final TextEditingController controller;
  final IconData icon;
  final String text;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
      child: TextFormField(
        enabled: selected? true: false,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.0,),
              borderRadius: BorderRadius.circular(8)
          ),
          // label: Text("नोंदणी क्रमांक"),
          label: Text(text),
          alignLabelWithHint: true,
        ),
      ),
    );
  }
}