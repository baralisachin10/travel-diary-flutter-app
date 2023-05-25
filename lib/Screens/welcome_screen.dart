import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //logo section
          Center(
            child: Image.asset(
              'lib/assets/icons/logo.png',
              height: 200,
              width: 200,
            ),
          ),

          //elevated button section

          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            child: const Text('Let\'s Go'),
          )
        ],
      ),
    );
  }
}
