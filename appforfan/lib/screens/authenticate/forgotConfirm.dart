import 'package:flutter/material.dart';

class ForgotConfirm extends StatefulWidget {
  final Function selectView;
  const ForgotConfirm({required this.selectView});

  @override
  _ForgotConfirmState createState() => _ForgotConfirmState();
}

class _ForgotConfirmState extends State<ForgotConfirm> {
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
                  'Email Sent!',
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
                        "Yeayy!! Reset Password email was send to you! follow the instruction on the email to reset your password",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.justify,
                      ),
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
                            onPressed: () => {widget.selectView('signin')},
                            child: const Text('Sign In Again'),
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
