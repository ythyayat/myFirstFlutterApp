import 'package:flutter/material.dart';
import 'package:appforfan/services/auth.dart';

class Home extends StatelessWidget {
  // const Home({Key? key}) : super(key: key);
  AuthService auth = AuthService();
  @override
  Widget build(BuildContext context) {
    print('cccc');
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.amberAccent,
        body: Column(
          children: <Widget>[
            Text('Home'),
            TextButton(onPressed: auth.logout, child: Text('Logout'))
          ],
        ),
      ),
    );
  }
}
