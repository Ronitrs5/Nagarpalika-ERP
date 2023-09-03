import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ButtonsNav extends StatelessWidget {
  const ButtonsNav({Key? key,required this.onPressCancel, required this.onPressSave, required this.onPressNext, required this.isLoading}) : super(key: key);

  final Function onPressCancel;
  final Function onPressSave;
  final Function onPressNext;

  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      margin: EdgeInsets.zero,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(width: 8,),
            Expanded(
              child: ElevatedButton(
                onPressed: (){onPressSave();},
                style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent, // Set the button color to green
                    padding: EdgeInsets.all(14)// Set the button color to red
                ),
                child: isLoading
                    ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                )
                    : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.save,size: 18,),
                    SizedBox(width: 4,),
                    Text("सेव"),
                  ],
                ),
              ),
            ),
            SizedBox(width: 8,),
            Expanded(
              child: ElevatedButton(
                onPressed: (){ onPressNext();},
                style: ElevatedButton.styleFrom(
                    primary: Colors.green, // Set the button color to green
                    padding: EdgeInsets.all(14)// Set the button color to red
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_forward,size: 18,),
                    SizedBox(width: 4,),
                    const Text('पुढे'),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
