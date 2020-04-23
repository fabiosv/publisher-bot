import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login();

  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  static String _email;
  static String _password;

  @override
  void initState() {
    super.initState();
    _email = '';
    _password = '';
  }
//https://medium.com/@nitishk72/form-validation-in-flutter-d762fbc9212c
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Flexible(
            flex: 3,
            child: Image(image: AssetImage('assets/images/logo.png')),
          ),
          Flexible(
            flex: 5,
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Email'),
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (String val) {
                      _email = val;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Password'),
                    keyboardType: TextInputType.visiblePassword,
                    onSaved: (String val) {
                      _password = val;
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  RaisedButton(
                    onPressed: _checkUser(),
                    child: new Text('Login'),
                  )
                ],
              )
            ),
          )
        ]
      ),
    );
  }

  _checkUser() {}
}
