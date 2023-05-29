import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // controllers for form field
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // formkey

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // user register function

  Future userRegister() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);

      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        'firstName': _firstNameController.text,
        'lastname': _lastNameController.text,
        'username': _userNameController.text,
        'email': _emailController.text,
        'password': _passwordController.text,
      }).then((value) => {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Register successful'),
                ))
              });
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Register Error')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register Now"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              //logo
              Image.asset(
                'lib/assets/icons/logo.png',
                height: 100,
                width: 100,
              ),
              const SizedBox(
                height: 10,
              ),
              // firstname
              TextFormField(
                controller: _firstNameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter your firstname';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Firstname',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // lastname
              TextFormField(
                controller: _lastNameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter your lastname';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Lastname',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // username
              TextFormField(
                controller: _userNameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter username';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // email field
              TextFormField(
                controller: _emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email is required';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              // password field
              TextFormField(
                controller: _passwordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password is required';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'password',
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              // confirm password field
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'confirm your password';
                  } else if (value != _passwordController.text) {
                    return 'Password didnot match';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Confirm password',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              //register now button
              InkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    userRegister();
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
                      'Sign Up',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/login');
                    },
                    child: const Text('Login'),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
