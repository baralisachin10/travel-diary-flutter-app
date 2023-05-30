import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:travel_diary/Screens/welcome_screen.dart';

import 'Screens/add_post_screen.dart';
import 'Screens/bottom_navbar_screen.dart';
import 'Screens/dashboard_screen.dart';
import 'Screens/login_screens.dart';
import 'Screens/profile_screen.dart';
import 'Screens/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const RegisterScreen(),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/bottomNavbar':(context) => const BottomNavbar(),
        '/dashboard': (context) => const DashboardScreen(),
        '/addPost':(context) => const AddPostScreen(),
        '/profile':(context) => const ProfileScreen(),
      },
    );
  }
}
