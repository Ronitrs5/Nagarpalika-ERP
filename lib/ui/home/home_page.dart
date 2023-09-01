import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

import '../authentication/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;

  bool isUserIdEmpty = false;
  bool isPasswordEmpty = false;

  bool isPasswordVisible = false;

  final TextEditingController userIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<bool> loginUser(String userId, String password) async {
    final url = Uri.parse(
        'https://nagarpalika-erp-api.azurewebsites.net/api/login/GetByLoginId/$userId/$password');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.blueAccent));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 32.0, bottom: 64),
                          child: Lottie.asset(
                            'assets/trash_car_anim.json',
                            width: 200,
                            height: 200,
                          ),
                        ),
                        const Text(
                          'Welcome Back!',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),

                        TextField(
                          controller: userIdController,
                          decoration: InputDecoration(
                            hintText: 'User ID',
                            border: const OutlineInputBorder(),
                            errorText: isUserIdEmpty ? 'Please enter User ID' : null,
                            errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red, // Customize the error border color
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        TextField(
                          controller: passwordController,
                          obscureText: !isPasswordVisible, // Toggle the obscureText based on isPasswordVisible
                          decoration: InputDecoration(
                            hintText: 'Password',
                            border: const OutlineInputBorder(),
                            errorText: isPasswordEmpty ? 'Please enter Password' : null,
                            errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red, // Customize the error border color
                              ),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isPasswordVisible = !isPasswordVisible; // Toggle the password visibility
                                });
                              },
                              icon: Icon(
                                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                color: Colors.grey, // Customize the eye icon color
                              ),
                            ),
                          ),
                        ),


                        const SizedBox(height: 20),

                        ElevatedButton(
                          onPressed: isLoading
                              ? null
                              : () async {
                            setState(() {
                              isLoading = true;
                              isUserIdEmpty = userIdController.text.isEmpty;
                              isPasswordEmpty = passwordController.text.isEmpty;
                            });

                            if (isUserIdEmpty || isPasswordEmpty) {
                              setState(() {
                                isLoading= false;
                              });

                            }
                            else {
                              // Proceed with the login logic
                              final loginSuccess = await loginUser(
                                  userIdController.text, passwordController.text);

                              setState(() {
                                isLoading = false;
                              });

                              if (loginSuccess) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Login Successful')),
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Login failed. Please try again.'),
                                    backgroundColor: Colors.red, // Customize the error message style
                                  ),
                                );
                              }
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: isLoading
                                ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.5,
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                              ),
                            )
                                : const Text('Login'),
                          ),
                        ),

                         Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              const Text(
                                "Don't have an user ID? ",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),

                              GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SingleChildScrollView(
                                        child: Container(
                                          padding: const EdgeInsets.all(16.0),
                                          child: const Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Center(
                                                child: Text(
                                                  "Registration Message",
                                                  style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 10),

                                              Divider(color: Colors.black12,),
                                              SizedBox(height: 10),
                                              Text(
                                                "Registration of user with USER ID and PASSWORD is done on our website.\n\n"
                                                    "To register visit our website given below:",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );

                                },
                                child: const Text(
                                  "Register here",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.blueAccent, // Customize the color for "Register here"
                                  ),
                                ),
                              )


                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "© Copyright Sanisoft Infotech. All Rights Reserved Designed by SanisoftGroup",
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
