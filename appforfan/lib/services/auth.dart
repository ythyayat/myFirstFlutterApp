import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get user {
    return _auth.idTokenChanges();
  }

  // get users data
  Future getUsers() async {
    User? user = await _auth.currentUser;
    print(user);
    return user;
  }

  // sign in with email
  Future signin(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      final User? user = userCredential.user;
      Map result = {'status': true};
      result.addAll({'user': user});
      return result;
    } on FirebaseAuthException catch (e) {
      Map result = {'status': false};
      if (e.code == 'user-not-found') {
        result.addAll({'message': 'No user found for that email.'});
      } else if (e.code == 'wrong-password') {
        result.addAll({'message': 'Wrong password provided for that user.'});
      } else {
        result.addAll({'message': e.message});
      }
      return result;
    }
  }

  // register
  Future register(String email, String password, String username) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      final User? user = userCredential.user;
      if (user != null) user.updateDisplayName(username);
      Map result = {'status': true};
      result.addAll({'user': user});
      return result;
    } on FirebaseAuthException catch (e) {
      Map result = {'status': false};
      if (e.code == 'user-not-found') {
        result.addAll({'message': 'No user found for that email.'});
      } else if (e.code == 'wrong-password') {
        result.addAll({'message': 'Wrong password provided for that user.'});
      } else {
        result.addAll({'message': e.message});
      }
      return result;
    } catch (e) {
      print(e);
    }
  }

  // confirmation email
  Future sendEmailRegister() async {
    User? user = _auth.currentUser;

    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  // reset email
  Future sendResetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  // sign out
  Future logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
