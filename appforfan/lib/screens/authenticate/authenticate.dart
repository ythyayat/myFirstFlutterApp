import 'package:appforfan/screens/authenticate/forgotpass.dart';
import 'package:appforfan/screens/authenticate/signin.dart';
import 'package:appforfan/screens/authenticate/signup.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  String show = 'signin';
  void selec(e) {
    setState(() => show = e);
  }

  @override
  Widget build(BuildContext context) {
    if (show == 'signin') {
      return SignIn(selectView: selec);
    } else if (show == 'signup') {
      return SignUp(selectView: selec);
    } else {
      return Forgot(selectView: selec);
    }
  }
}
