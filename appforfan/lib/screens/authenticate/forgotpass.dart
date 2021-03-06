import 'package:appforfan/constant/constant.dart';
import 'package:appforfan/constant/validator.dart';
import 'package:flutter/material.dart';
import 'package:appforfan/services/auth.dart';

class Forgot extends StatefulWidget {
  final Function selectView;
  const Forgot({required this.selectView});

  @override
  _ForgotState createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  final AuthService _auth = AuthService();
  final Validation validation = Validation();
  String email = '';

  void forgotAction() async {
    bool validEmail = validation.email(email);
    if (!validEmail) {
      final snackBar = SnackBar(
        content: Text('Please input valid email'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      var result = await _auth.sendResetEmail(email);
      if (!result['status']) {
        final snackBar = SnackBar(
          content: Text(result['message']),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else
        widget.selectView('forgotConfirm');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF42A5F5),
      appBar: AppBar(
        backgroundColor: Color(0x6F0D47A1),
        elevation: 0.0,
        title: Text('AppForFan'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Card(
          color: Color(0xFF1976D2),
          margin: EdgeInsets.fromLTRB(30.0, 70.0, 30.0, 0.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Forgot Password',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Divider(
                color: Color(0xFF42A5F5),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(13, 8, 13, 23),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'email'),
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Stack(
                        children: <Widget>[
                          Positioned.fill(
                            child: Container(
                              decoration:
                                  const BoxDecoration(color: Color(0xFF42A5F5)),
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(13.0),
                              primary: Colors.white,
                              textStyle: const TextStyle(fontSize: 16),
                            ),
                            onPressed: () => {forgotAction()},
                            child: const Text('Send Request Email'),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(13.0),
                        primary: Colors.white,
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                      onPressed: () => widget.selectView('signin'),
                      child: const Text('Back'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
