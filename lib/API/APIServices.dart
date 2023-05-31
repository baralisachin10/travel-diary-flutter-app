import 'package:firebase_auth/firebase_auth.dart';

class APIServices {
  Future<bool> login(String email, String password) async {
    bool isLogin = false;
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        isLogin = true;
      }).onError((error, stackTrace) {
        isLogin = false;
      });
    } catch (e) {
      print(e);
    }
    return isLogin;
  }
}
