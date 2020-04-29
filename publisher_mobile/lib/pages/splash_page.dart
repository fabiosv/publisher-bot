import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './home.dart';
import '../models/User.dart';

import '../services/user.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  initState() {
    FirebaseAuth.instance
      .currentUser().then((currentUser) {
        if (currentUser == null)
          { Navigator.of(context).pushNamed('/login'); }
        else
        {
          UserAPI.get(currentUser.uid).then((User user) =>
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Home(
                    user: user
                  ))))
            .catchError((err) => print(err));
        }
    }).catchError((err) => print(err));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("Loading..."),
        ),
      ),
    );
  }
}