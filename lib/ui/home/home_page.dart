import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:house_cleaning/ui/authentication/login_page.dart';
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;


  final TextEditingController userIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<bool> loginUser(String userId, String password) async {
    final url = Uri.parse('https://nagarpalika-erp-api.azurewebsites.net/api/login/GetByLoginId/$userId/$password');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

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
               TextField(
                controller: userIdController,
                decoration: const InputDecoration(
                  hintText: 'User ID',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
               TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: isLoading
                    ? null
                    : () async {
                  setState(() {
                    isLoading = true;
                  });


                  final userId = userIdController.text;
                  final password = passwordController.text;
                  final loginSuccess = await loginUser(userId, password);

                  setState(() {
                    isLoading = false;
                  });

                  if (loginSuccess) {

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Login Successful')),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Login failed. Please try again.')),
                    );
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