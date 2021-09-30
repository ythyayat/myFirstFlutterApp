import 'package:appforfan/constant/constant.dart';
import 'package:appforfan/constant/validator.dart';
import 'package:flutter/material.dart';
import 'package:appforfan/services/auth.dart';

class SignUp extends StatefulWidget {
  final Function selectView;
  const SignUp({required this.selectView});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = AuthService();
  final Validation validation = Validation();

  String email = '';
  String password = '';
  String passwordConfirm = '';
  String username = '';

  void sigupAction() async {
    bool validName = validation.name(username);
    bool validPassword = validation.password(password);
    print(validPassword);
    if (!validName) {
      final snackBar = SnackBar(
        content: Text('Please input valid name'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (!validPassword) {
      final snackBar = SnackBar(
        content: Text('Min 8 chars, 1 Uppercase, 1 lowercase, 1 number'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (password != passwordConfirm) {
      final snackBar = SnackBar(
        content: Text('Your password confirm not macth'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      var result = await _auth.register(email, password, username);
      if (!result['status']) {
        final snackBar = SnackBar(
          content: Text(result['message']),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
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
                  'SignUp',
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
                        'Username',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'username'),
                      onChanged: (val) {
                        setState(() => username = val);
                      },
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    TextFormField(
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration:
                          textInputDecoration.copyWith(hintText: 'password'),
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Password Confirmation',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    TextFormField(
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration:
                          textInputDecoration.copyWith(hintText: 'password'),
                      onChanged: (val) {
                        setState(() => passwordConfirm = val);
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(13.0),
                            primary: Colors.white,
                            textStyle: const TextStyle(fontSize: 16),
                          ),
                          onPressed: () => widget.selectView('signin'),
                          child: const Text('Already have account? Sign in'),
                        ),
                      ],
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
                            onPressed: () => {sigupAction()},
                            child: const Text('Sign Up'),
                          ),
                        ],
                      ),
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
