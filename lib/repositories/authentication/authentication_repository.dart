import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:wanin_interview_login/utils/utils.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> logIn({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      LogHelper.d(context: null, msg: userCredential.user.toString());
      await Future.delayed(
        const Duration(milliseconds: 300), () => _controller.add(AuthenticationStatus.authenticated,),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        LogHelper.d(context: null, msg: "error:$e, The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        LogHelper.d(context: null, msg: "error:$e, The account already exists for that email.");
      } else {
        LogHelper.d(context: null, msg: "?????:$e");
      }
    } catch (e) {
      LogHelper.d(context: null, msg: "error:$e");
    }
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
