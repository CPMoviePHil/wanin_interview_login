import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:wanin_interview_login/models/user.dart';

class UserRepository {
  User? _user;

  Future<User?> getUser() async {
    if (_user != null) return _user;
    firebase.User? firebaseUser = firebase.FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      return Future.delayed(const Duration(milliseconds: 300), () => _user = User(
        id: firebaseUser.uid, userName: firebaseUser.email,
      ),);
    }
  }
}