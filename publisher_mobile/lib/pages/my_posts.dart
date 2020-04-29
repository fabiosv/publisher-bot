import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/User.dart';
import '../models/Post.dart';

import './create_post.dart';

class MyPosts extends StatelessWidget {
  MyPosts();

  @override
  Widget build(BuildContext context) {
    final user = User.of(context);
    final uid = user.uid;
    print('MyPost - $uid');
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Meus Posts '),
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