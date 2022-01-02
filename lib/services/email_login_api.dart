import 'package:firebase_auth/firebase_auth.dart';

class EmailLoginApi {
  FirebaseAuth mAuth = FirebaseAuth.instance;

  emailAccountReg(String email, String password) async {
    try {
      await mAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
      } else if (e.code == 'email-already-in-use') {}
    }
  }

  emailSignIn(String email, String password) async {
    try {
      await mAuth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
      } else if (e.code == 'wrong-password') {}
    }
  }

  signOut() async {
    if (mAuth.currentUser != null) {
      await mAuth.signOut();
    }
  }
}
