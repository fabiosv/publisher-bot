import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Groups extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
          title: Text('Grupos')
      ),
      body: Center(child: Text('Lista de Grupos')),
    );
  }
}