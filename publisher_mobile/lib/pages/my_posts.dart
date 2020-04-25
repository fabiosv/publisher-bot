import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPosts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Meus Posts'),
      ),
      body: Center(
        child: Text('Nada aqui por enquanto ;D'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed('/create_post'),
        child: Icon(Icons.create),
      ),
    );
  }

}