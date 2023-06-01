import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:firebase_core/firebase_core.dart';

class APIServices {
  Future<bool> login(String email, String password) async {
    bool isLogin = false;
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        // prefs.setString('id', value.user!.uid);
        isLogin = true;
      }).onError((error, stackTrace) {
        isLogin = false;
      });
    } catch (e) {
      print(e);
    }
    return isLogin;
  }

  Future<bool> register(String firstName, String lastName, String username,
      String email, String password) async {
    bool isRegister = false;
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        'firstName': firstName,
        'lastName': lastName,
        'username': username,
        'email': email,
        'password': password,
      }).then((value) {
        isRegister = true;
      }).onError((error, stackTrace) {
        isRegister = false;
      });
    } catch (e) {
      print(e);
    }
    return isRegister;
  }
}
