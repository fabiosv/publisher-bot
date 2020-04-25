import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text('Histórico'), leading: Container(),),
      body: Center(child: Text('Histórico das postagens'),),
    );
  }
}