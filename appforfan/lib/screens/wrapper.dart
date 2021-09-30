import 'package:appforfan/screens/authenticate/authenticate.dart';
import 'package:appforfan/screens/authenticate/verifyEmail.dart';
import 'package:appforfan/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);

    if (user == null) {
      return Authenticate();
    } else if (!user.emailVerified) {
      return VerifyEmail();
    } else {
      return Home();
    }
  }
}
