import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Login extends StatefulWidget {
  Login();

  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";
  bool _autoValidate = false;

  @override
  void initState() {
    super.initState();
  }
//https://medium.com/@nitishk72/form-validation-in-flutter-d762fbc9212c
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Flexible(
            flex: 2,
            child: Image(image: AssetImage('assets/images/logo.png')),
          ),
          Flexible(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(20.0),
              margin: EdgeInsets.all(5.0),
              child: Form(
                  key: _formKey,
                  autovalidate: _autoValidate,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new TextFormField(
                        decoration: const InputDecoration(labelText: 'Email'),
                        keyboardType: TextInputType.emailAddress,
                        validator: validateEmail,
                        onSaved: (String val) {
                          _email = val;
                        },
                      ),
                      new TextFormField(
                        decoration: const InputDecoration(labelText: 'Password'),
                        keyboardType: TextInputType.visiblePassword,
                        validator: validatePassword,
                        onSaved: (String val) {
                          _password = val;
                        },
                      ),
                      new SizedBox(
                        height: 30.0,
                      ),
                      Center(
                        child: new RaisedButton(
                          onPressed: _checkUser,
                          child: new Text('Login'),
                        ),
                      )
                    ],
                  )
              ),
            )
          )
        ]
      ),
    );
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  String validatePassword(String value) {
    if (value.length < 3)
      return 'Password não pode ser vazio';
    else
      return null;
  }

  void _checkUser() {
    debugPrint('>>>>>>>>>>>>>>>>>>>>>>>>');
    debugPrint('email: ($_email)');
    debugPrint('password: ($_password)');
    if(_formKey.currentState.validate()) {
      _formKey.currentState.save();
      Navigator.of(context).pushNamed('/home');
    } else {
      _autoValidate = true;
    }
  }
}
