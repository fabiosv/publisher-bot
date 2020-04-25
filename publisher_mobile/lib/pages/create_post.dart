import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CreatePost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Criar um novo post')),
      body: Center(child: Text('Adicione um novo Post aqui ;D'),),
    );
  }

}