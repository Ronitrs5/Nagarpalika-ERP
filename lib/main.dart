import 'package:flutter/material.dart';
import 'package:house_cleaning/ui/authentication/login_page.dart';
import 'package:house_cleaning/ui/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  static const bool auth=false;
  //TODO change to firebase here after adding firebase

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: auth ? LoginPage() : LoginPage()),
    );
  }
}
