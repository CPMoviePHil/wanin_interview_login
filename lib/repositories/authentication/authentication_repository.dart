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

  Future<void> _logIn ({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      LogHelper.d(context: null, msg: userCredential.user.toString());
      await Future.delayed(
        const Duration(milliseconds: 300), () => _controller.add(AuthenticationStatus.authenticated,),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        LogHelper.d(context: null, msg: "login error:$e, e.code:${e.code}, No user found for that email.");
      } else if (e.code == 'wrong-password') {
        LogHelper.d(context: null, msg: "login error:$e, e.code:${e.code}, Wrong password provided for that user.");
      } else {
        LogHelper.d(context: null, msg: "login other error:$e");
      }
      throw e.code;
    } catch (e) {
      LogHelper.d(context: null, msg: "login error:$e");
    }
  }

  Future<void> register ({
    required String email,
    required String password,
  }) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    LogHelper.d(context: null, msg: "currentUSER:$currentUser");
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
        LogHelper.d(context: null, msg: "register error:$e, e.code:${e.code}, The password provided is too weak.");
        throw e.code;
      } else if (e.code == 'email-already-in-use') {
        LogHelper.d(context: null, msg: "register error:$e, e.code:${e.code}, The account already exists for that email.");
        await _logIn(
          email: email,
          password: password,
        );
      } else {
        LogHelper.d(context: null, msg: "register other error:$e");
        throw e.code;
      }
    } catch (e) {
      LogHelper.d(context: null, msg: "register error:$e");
      rethrow;
    }
  }

  Future<void> logOut() async{
    FirebaseAuth.instance.signOut();
    Future.delayed(const Duration(seconds: 1), () => _controller.add(AuthenticationStatus.unauthenticated),);
  }

  void dispose() => _controller.close();
}
