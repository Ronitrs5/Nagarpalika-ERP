import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:house_cleaning/ui/authentication/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.blueAccent));
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 32.0,bottom: 64),
                child: Icon(Icons.login,size: 100,),
              ),
              const Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'User ID',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Login'),
                ),
              ),
              const SizedBox(height: 10),

              // TextButton(
              //   onPressed: () {
              //
              //   },
              //   child: Text('Forgot Password?'),
              // ),
              // SizedBox(height: 20),
              // Text(
              //   'Or sign in with',
              //   textAlign: TextAlign.center,
              // ),
              // SizedBox(height: 10),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Icon(Icons.facebook),
              //     SizedBox(width: 20),
              //     Icon(Icons.facebook),
              //   ],
              // ),
              // // Spacer(),
              // SizedBox(height: 32,),
              // Text(
              //   'Don\'t have an account? Sign up',
              //   textAlign: TextAlign.center,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}