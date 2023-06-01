// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_diary/API/APIServices.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //form key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //function for login
  Future _userLogin(BuildContext context) async {
    //firebase auth
    APIServices()
        .login(_emailController.text, _passwordController.text)
        .then((value) => {
              if (value == true)
                {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('login successful'))),
                  Navigator.pushNamed(context, '/bottomNavbar')
                }
              else
                {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('login successful'))),
                }
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login Now'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //logo
                  Image.asset(
                    'lib/assets/icons/logo.png',
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  //email field
                  TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please Enter your email';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),

                  const SizedBox(height: 20),
                  // password field
                  TextFormField(
                    controller: _passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please Enter your password';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  // login button
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _userLogin(context);
                      }
                    },
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue,
                      ),
                      child: const Center(
                        child: Text(
                          'Login',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: const Text('create a new account'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
